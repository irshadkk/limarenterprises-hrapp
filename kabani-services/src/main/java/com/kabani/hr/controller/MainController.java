package com.kabani.hr.controller;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kabani.hr.entity.User;
import com.kabani.hr.entity.UserAttendanceDetails;
import com.kabani.hr.entity.UserAttendanceGrid;
import com.kabani.hr.repository.UserAttendanceDetailsRepository;
import com.kabani.hr.repository.UserRepository;

@CrossOrigin
@Controller // This means that this class is a Controller
// @RequestMapping(path = "/demo") // This means URL's start with /demo (after
// Application path)
public class MainController {
	private final Logger logger = LogManager.getLogger(this.getClass());

	@Autowired // This means to get the bean called userRepository
				// Which is auto-generated by Spring, we will use it to handle the data
	private UserRepository userRepository;
	@Autowired
	private UserAttendanceDetailsRepository userAttendanceDetailsRepository;

	@GetMapping(path = "/add") // Map ONLY GET Requests
	public @ResponseBody String addNewUser(@RequestParam String name, @RequestParam String email,
			@RequestParam String password) {
		// @ResponseBody means the returned String is the response, not a view name
		// @RequestParam means it is a parameter from the GET or POST request

		User n = new User();
		n.setName(name);
		n.setEmail(email);
		n.setPassword(password);
		userRepository.save(n);
		return "Saved";
	}

	@GetMapping(path = "/all")
	public @ResponseBody Iterable<User> getAllUsers() {
		// This returns a JSON or XML with the users
		return userRepository.findAll();
	}

	@GetMapping(path = "/login")
	public @ResponseBody boolean doLogin(@RequestParam String name, @RequestParam String password) {
		// This returns a JSON or XML with the users
		User resultUser = userRepository.findByNameAndPassword(name, password);
		if (resultUser != null) {
			return true;
		} else {
			return false;
		}

	}

	@PostMapping(path = "/upload/{name}")
	public @ResponseBody String[] handleFileUpload(@RequestParam("file") MultipartFile file, @PathVariable String name)
			throws Exception {
		String[] response = { "" };
		InputStream is = null;
		BufferedReader bfReader = null;
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
		ArrayList employeeDataList = new ArrayList();
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				is = new ByteArrayInputStream(bytes);
				bfReader = new BufferedReader(new InputStreamReader(is));
				bfReader.readLine();// it reads the first line so it removes the heading from the file
				String employeeAttendanceString = null;
				String[] employeeAttendance = null;
				// employeeAttendance = bfReader.readLine().split(",")) != null
				while (((employeeAttendanceString = bfReader.readLine()) != null)
						&& ((employeeAttendance = employeeAttendanceString.split(",")) != null)) {

					UserAttendanceDetails userAttendanceDetails = new UserAttendanceDetails();

					String date[] = employeeAttendance[0].split("-");
					int day = Integer.parseInt(date[0]);
					String month = date[1];
					int year = 2000 + Integer.parseInt(date[2]);
					String dateString = day + "-" + month + "-" + year;

					userAttendanceDetails.setDate(formatter.parse(dateString));

					userAttendanceDetails.setDay(day);

					userAttendanceDetails.setMonth(month);

					userAttendanceDetails.setYear(year);

					userAttendanceDetails.setEmployeeCode(employeeAttendance[1]);

					userAttendanceDetails.setName(employeeAttendance[2]);

					userAttendanceDetails.setEmployeeName(employeeAttendance[2]);

					userAttendanceDetails.setCompany(employeeAttendance[3]);

					userAttendanceDetails.setDepartment(employeeAttendance[4]);

					userAttendanceDetails.setInTime(employeeAttendance[10]);

					userAttendanceDetails.setOutTime(employeeAttendance[11]);

					userAttendanceDetails.setDuration(employeeAttendance[12]);

					userAttendanceDetails.setLateBy(employeeAttendance[13]);

					userAttendanceDetails.setEarlyBy(employeeAttendance[14]);

					userAttendanceDetails.setStatus(employeeAttendance[15].replaceAll("½", "1/2"));

					String punchRecords = "";
					int i = 15;
					while (employeeAttendance.length - 1 > i) {
						i = i + 1;
						punchRecords += employeeAttendance[i];

					}

					userAttendanceDetails.setPunchRecords(punchRecords);

					userAttendanceDetails.setComment("");

					userAttendanceDetails.setBranch(name);
					employeeDataList.add(userAttendanceDetails);

				}
				userAttendanceDetailsRepository.save(employeeDataList);
				response[0] = "The file " + file.getOriginalFilename() + "is uploaded successfully";

			} catch (Exception e) {
				logger.error("****Exception in handleFileUpload() " + e.getMessage());
				response[0] = "****Exception in handleFileUpload() " + e.getMessage();
				throw e;
			} finally {
				try {
					if (is != null)
						is.close();
				} catch (Exception ex) {

				}
			}
		} else {
			response[0] = "The file is empty";
		}
		return response;
	}

	@PostMapping(path = "/getAllAttandance")
	public @ResponseBody Iterable<UserAttendanceDetails> getAttendanceDetails() {
		return userAttendanceDetailsRepository.findAll();
	}

	@GetMapping(path = "/findAllAttendanceForMonth")
	public @ResponseBody List<UserAttendanceGrid> findAllAttendanceForMonth(@RequestParam("month") int month,
			@RequestParam("year") int year) {
		Map<String, UserAttendanceGrid> attandanceGrid = new HashMap<String, UserAttendanceGrid>();
		List<UserAttendanceDetails> userAttendanceDetails = userAttendanceDetailsRepository
				.findAllAttendanceForMonth(month, year);
		for (UserAttendanceDetails user : userAttendanceDetails) {
			UserAttendanceGrid temp = null;
			if (attandanceGrid.containsKey(user.getEmployeeCode())) {
				temp = attandanceGrid.get(user.getEmployeeCode());
			} else {
				temp = new UserAttendanceGrid(user.getEmployeeCode(), user.getEmployeeName());
			}
			if (user.getStatus().equals("Present")) {
				temp.getEmployeeAttndance()[user.getDay() - 1] = "P";
			} else if (user.getStatus().equals("1/2Present")) {
				temp.getEmployeeAttndance()[user.getDay() - 1] = "H";
			} else if (user.getStatus().equals("Present On leave(CL)")) {
				temp.getEmployeeAttndance()[user.getDay() - 1] = "A";
			} else {
				temp.getEmployeeAttndance()[user.getDay() - 1] = "U";
			}
			temp.setMonth(user.getMonth());
			temp.setYear(user.getYear());
			temp.setStatus(user.getStatus());
			temp.setBranch(user.getBranch());
			temp.setCompany(user.getCompany());
			temp.setDepartment(user.getDepartment());
			temp.setInTime(user.getInTime());
			temp.setOutTime(user.getOutTime());
			temp.setDuration(user.getDuration());
			
			attandanceGrid.put(user.getEmployeeCode(), temp);

		}
		
		
		 List<UserAttendanceGrid> result=new ArrayList<UserAttendanceGrid>(attandanceGrid.values());
		Collections.sort(result);
		return result ;
	}
	@GetMapping(path = "/getEmployAttandanceForDay")
	public @ResponseBody UserAttendanceDetails getEmployAttandanceForDay(@RequestParam("month") int month,
			@RequestParam("year") int year, @RequestParam("day") int day,
			@RequestParam("employeeCode") String employeeCode) {
		return userAttendanceDetailsRepository.getEmployAttandanceForDay(month, year,day,employeeCode);
	}

	@PostMapping(path = "/updateUserAttandance")
	public @ResponseBody boolean updateUserAttandance(@RequestBody UserAttendanceDetails userAttendanceDetails) {
		try {
			userAttendanceDetailsRepository.save(userAttendanceDetails);
			return true;
		} catch (Exception e) {
			System.out.println("--------------------------------------------");
			System.out.println(e);
			System.out.println("--------------------------------------------");
			return false;

		}
	}

	@PostMapping(path = "/getDistinctEmployees")
	public @ResponseBody List<UserAttendanceDetails> getDistinctEmployees() {
		return userAttendanceDetailsRepository.findDistinctByName();
	}

	@PostMapping(path = "/getDistinctEmployeesO")
	public @ResponseBody List getDistinctEmployeesO() {
		return userAttendanceDetailsRepository.findDistinctByNameO();
	}

}
