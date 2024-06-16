import { LightningElement,api,track } from 'lwc';
import updateTask from '@salesforce/apex/TaskController.updateTask';
export default class Task8 extends LightningElement {
     @api recordId;

     @track taskSubject;
     @track taskActivityDate;
     @track taskStatus;
    @track statusOptions = [
        { label: 'Not Started', value: 'Not Started' },
        { label: 'In Progress', value: 'In Progress' },
        { label: 'Completed', value: 'Completed' },
        { label: 'Deferred', value: 'Deferred' },
        { label: 'Waiting', value: 'Waiting' }];
     @track taskPriority;
     @track TaskData;
     @track error;

     handelSubjectchange(event){
        debugger;
        this.taskSubject = event.target.value;
        console.log("this.taskSubject===>"+JSON.stringify(this.taskSubject));
     }

     handelActivityDatechange(event){
         this.taskActivityDate = event.target.value;
         console.log("this.taskActivityDate====>"+JSON.stringify(this.taskActivityDate));
     }

      handelStatuschange(event){
        debugger;
         this.taskStatus = event.target.value;
          console.log("this.taskStatus===>"+JSON.stringify(this.taskStatus));
    }

     handleUpdate(){
        debugger;
        updateTask({accountId : this.recordId,
          taskSubject :this.taskSubject,
          taskActivityDate :this.taskActivityDate,
          taskStatus :this.taskStatus  
          })
          .then((result) => {
              console.log("result===>"+JSON.stringify(result));
              this.TaskData = result;
             this.showSuccessToast('Record Updated', 'Record updated successfully');
             return refreshApex(this.TaskData);
          }).catch((err) => {
               console.log("err===>"+JSON.stringify(err));
               this.error = err;
               this.showErrorToast('Error', 'Error updating the record');
          });
    }

}