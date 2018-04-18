import { Component, TemplateRef, OnInit } from '@angular/core';
import { DataService } from '../../data.service';
import { BlockUI, NgBlockUI } from 'ng-block-ui';
// import { NotificationsService } from 'angular4-notify';

@Component({
  templateUrl: 'viewleavesummary.component.html',
  styleUrls: ['viewleavesummary.component.css']
})
export class ViewleavesummaryComponent implements OnInit {


  public employeeArr;
  public statusArr = ["Present", "1/2Present","Present On leave(CL)"]
  @BlockUI() blockUI: NgBlockUI;
  
  public daysArr = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  public days = this.daysArr[0];
  Arr = Array; //Array type captured in a variable
  public month =this.dataService.getSelectedMonth();
  public year = this.dataService.getSelectedYear();
  public notificationOptions = {
    position: ["bottom", "right"],
    timeOut: 5000,
    lastOnBottom: true,
    showProgressBar: true,
    pauseOnHover: true,
    clickToClose: true,
  }
  constructor(private dataService: DataService ) { }
  ngOnInit() {
    if (this.dataService.appDefined()) {
     this.objChanged();
    }
  }
  oddRow(rowNum: number) {
    return (rowNum % 2 == 0)?"evenRow":"";
  }
  objChanged() {
    this.employeeArr = [];
    this.days=this.daysArr[this.dataService.monthSelectArr.indexOf(this.month)];
    this.loadEmployeesAttandance(this.dataService.monthSelectArr.indexOf(this.month)+1,parseInt(""+this.year));
  }

  getColour(value: any) {
    if (value == "P") return "present";
    else if (value == "A") return "absent";
    else if (value == "H") return "half";
    else return "unmapped";
  }
  loadEmployeesAttandance(month: number, year: number) {
    this.blockUI.start("Loading..");
    this.dataService.getData(this.dataService.serviceurl + 'findAllAttendanceForMonth?year=' + year + "&month=" + month).subscribe(data => {
      this.employeeArr = data;
      setTimeout(() => {
        this.blockUI.stop();
      }, 1500);

    },
      (error => { this.handleError(error, "loadEmployeesAttandance()"); }));
  }

  
  changeinLeave() {
    this.currentItem.casualLeavesRemaining = parseInt(this.currentItem.totalCasualAlloted) - parseInt(this.currentItem.casualLeavesTaken)
  }

  onResetClick() {
    this.employeeArr.forEach(element => {
      element.casualLeavesTaken = 0;
      element.totalCasualAlloted = 12;
      element.casualLeavesRemaining = 12;
      this.dataService.getPostData(this.dataService.serviceurl + 'leave/addorupdateempleave', element).subscribe(data => {
      },
        (error => { this.handleError(error, "onResetClick()"); }));
    });
  }
  getTitle(emp:any,day:number){
    let status="";
    if(emp.employeeAttndance[day-1]==null||emp.employeeAttndance[day-1]==""||emp.employeeAttndance[day-1]=="U"){
      status="UnMapped"
    }
    else if(emp.employeeAttndance[day-1]=="P"){
      status="Present"
    }
    else if(emp.employeeAttndance[day-1]=="A"){
      status="Absent"
    }else if(emp.employeeAttndance[day-1]=="H"){
      status="1/2 Day"
    }
    return "Employee :"+emp.employeeName+"\n"+"Day :"+emp.month+" "+day+" "+emp.year+"\nStatus :"+status;
  }
  currentItem:any = [];
  currentItemStatus:any="";
  modifyAttandance(emp:any,day:number,infoModal:any){    
    this.blockUI.start("Loading..");
    this.dataService.getData(this.dataService.serviceurl + 'getEmployAttandanceForDay?year=' + emp.year + "&month=" + (this.dataService.monthSelectArr.indexOf(emp.month)+1)+ "&day=" +(day+1)+ "&employeeCode=" + emp.employeeId).subscribe(data => {
      this.currentItem = data;
      alert(data)
      this.currentItemStatus=this.currentItem.status;
      infoModal.show();
      setTimeout(() => {
        this.blockUI.stop();
      }, 500);

    },
      (error => { this.handleError(error, "modifyAttandance()"); }));    
  }

  saveChanges(infoModal:any) {
    this.blockUI.start("Saving..");
    this.dataService.getPostData(this.dataService.serviceurl + 'updateUserAttandance', this.currentItem).subscribe(data => {
      if (data == true) {
        // this.notificationsService.addInfo('Changes Saved');
        this.loadEmployeesAttandance(this.dataService.monthSelectArr.indexOf(this.month)+1,parseInt(""+this.year));
        infoModal.hide();
      } else {
        // this.notificationsService.addWarning('Changes couldnt be saved');
      }
      setTimeout(() => {
        this.blockUI.stop();
      }, 1500);
    },
      (error => { this.handleError(error, "saveChanges()"); }));

  }

  private handleError(error: any, method: any) {
    console.error('An error occurred in ViewleavesummaryComponent at method ' + method, +" " + error);
    this.blockUI.stop();
    // this.notificationsService.addError('An error occurred in ViewleavesummaryComponent at method ' + method + " " + error);
  }


}
