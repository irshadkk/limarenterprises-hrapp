import { Component, TemplateRef, OnInit } from '@angular/core';
import { DataService } from '../../data.service';
import { SalaryService } from '../viewsalary/salary.service';
import { BlockUI, NgBlockUI } from 'ng-block-ui';
import { NotificationsService } from 'angular4-notify';

@Component({
  selector: 'app-manage-loan',
  templateUrl: './manage-loan.component.html',
  styleUrls: ['./manage-loan.component.scss']
})
export class ManageLoanComponent implements OnInit {

  loading: boolean = false;
  public loanList = [];
  public monthSelectArr = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
  public yearSelectArr = ["2017", "2018", "2019", "2020", "2020", "2021",
    "2022", "2023", "2024", "2025", "2026", "2027"];
  public month = this.monthSelectArr[0];
  public year = this.yearSelectArr[0];
  @BlockUI() blockUI: NgBlockUI;

  public notificationOptions = {
    position: ["bottom", "right"],
    timeOut: 5000,
    lastOnBottom: true,
    showProgressBar: true,
    pauseOnHover: true,
    clickToClose: true,
  }
  constructor(private dataService: DataService, private salaryService: SalaryService, protected notificationsService: NotificationsService) {

  }
  ngOnInit() {
    if (this.dataService.appDefined()) {
      this.loadEmployees();
    }
  }
  objChanged() {
    this.loanList = [];
    this.loadActiveLoans(this.year, (this.monthSelectArr.indexOf(this.month) ));
  }
  loadActiveLoans(year, month: number) {
    this.notificationsService.notifications.closed;
    this.blockUI.start("Loading..");
    this.loading = true;
    this.salaryService.loadActiveLoans(year, month)
      .subscribe(data => {
        this.loanList = data;
        this.loading = false;
        setTimeout(() => {
          this.blockUI.stop();
        }, 1500);
      },
        error => this.handleError(error, "loadActiveLoans()")
      );
  }
  loan = { "id": "", "employeeCode": "", "employeeName": "", "loanAmount": "", "loanTenure": "", "availDate": "", "status": "" }
  loanTenure = [{ "value": "2" }, { "value": "3" }, { "value": "4" }, { "value": "5" }, { "value": "6" }, { "value": "7" }, { "value": "8" }, { "value": "9" }, { "value": "10" }, { "value": "11" }, { "value": "12" }];
  addNewLoan(infoModal: any) {
    this.loan = { "id": "", "employeeCode": "", "employeeName": "", "loanAmount": "", "loanTenure": "", "availDate": "", "status": "active" };
    infoModal.show();
  }

  saveChanges() {
    this.dataService.getPostData(this.dataService.serviceurl + 'salary/addNewLoan', this.loan).subscribe(data => {
      this.loadActiveLoans(this.year, (this.monthSelectArr.indexOf(this.month)));
    });

  }
  onEditClick(infoModal, item) {
    this.loan = item;
    infoModal.show(); 
  }
  employeeArr = [];
  loadEmployees() {
    this.blockUI.start("Loading..");
    this.dataService.getData(this.dataService.serviceurl + 'employee/all').subscribe(data => {
      this.employeeArr = data;
      setTimeout(() => {
        this.blockUI.stop();
      }, 1500);


    },
      (error => { this.handleError(error, "loadEmployees()"); }));
  }
  onChange(event) {
    for (let emp of this.employeeArr) {
      if (emp.employeeBioDeviceCode == event.target.value) {
        this.loan.employeeName = emp.employeeName;
        this.loan.employeeCode = emp.employeeBioDeviceCode;      }
    }
  }
  updateChanges(){
    if(this.loan.status=='closed'){
      this.dataService.getPostData(this.dataService.serviceurl + 'salary/closeLoan', this.loan).subscribe(data => {
        this.loadActiveLoans(this.year, (this.monthSelectArr.indexOf(this.month)));
      });
    }
  }
  private handleError(error: any, method: any) {
    this.notificationsService.notifications.closed;
    this.loading = false;
    console.error('An error occurred in ManageLoan at method ' + method, +" " + error);
    this.blockUI.stop();
    this.notificationsService.addError('An error occurred in ManageLoan at method ' + method + " " + error);
  }

}



