import { LightningElement, api,track } from 'lwc';
import getTaskrecord from '@salesforce/apex/taskHandler.getTaskrecord';
import updateTaskUsinJSON from '@salesforce/apex/taskHandler.updateTaskUsinJSON';
import getAccountRelatedTask from '@salesforce/apex/taskHandler.getAccountRelatedTask';

import { CloseActionScreenEvent } from 'lightning/actions';
import { RefreshEvent } from 'lightning/refresh';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class UpdateTask8 extends LightningElement {

    @api accId;

    @api recordId;
    tasks =[];
    error;
    datatopass;
    @track statusOptions = [
        { label: ' Not Started', value: ' Not Started' },  
        { label: 'In Progress', value: 'In Progress' },
        { label: 'Completed', value: 'Completed' },
        { label: 'Deferred', value: 'Deferred' }]

    connectedCallback() {
        debugger;  
        setTimeout(()=>{
        this.fetchTasks();
        },300);
       
    }
    
    //This method is calling when record is kept on record page and using record Id.
    //  fetchTasks() {
    //     debugger;
    //     getTaskrecord({ recId: this.recordId })
    //         .then(result => {
    //             this.tasks = result;
    //             this.tasks.forEach(task => {
    //                 task.edit = false; 
    //             });    
    //         })
    //         .catch(error => {
    //          console.log('error--->',error);
    //         });
    // }


     //This method is calling when record is kept on Home page and using accountId.
    fetchTasks() {
        var data = this.accId;
        debugger;
        getAccountRelatedTask({ accountId: this.accId })
            .then(result => {
                this.tasks = result;
                this.tasks.forEach(task => {
                    task.edit = false; 
                });    
            })
            .catch(error => {
             console.log('error--->',error);
            });
    }
     handleInputChange(event) {
        debugger;
        const { index, field } = event.currentTarget.dataset;
        const value = event.target.value;
        this.tasks[index][field] = value;
    }

     handleEdit(event) {
        debugger;
        const index = event.currentTarget.dataset.index;
        this.tasks[index].edit = true;
    }

   
 newStatus;
  
   handleSave() {
        debugger;
        const taskIdsToUpdate = [];
         var tempdata = [];
        // Use a separate loop to collect taskIdsToUpdate
        for (let i = 0; i < this.tasks.length; i++) {
            var obj = {
                taskId : this.tasks[i].Id,
                status : this.tasks[i].Status,
                Subject : this.tasks[i].Subject,
            };
            tempdata.push(obj);
            // if (this.tasks[i].Id != null) {
            //     this.newStatus = this.tasks[i].Status;
            //     taskIdsToUpdate.push(this.tasks[i].Id);
            // }
        }
         this.datatopass = tempdata;
         updateTaskUsinJSON({ taskDataList: this.datatopass})
         .then(result =>{
             console.log('Records updated successfully:', result);
             this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Records updated successfully',
                        variant: 'success',
                    })
                );
             this.dispatchEvent(new RefreshEvent());
             this.dispatchEvent(new CloseActionScreenEvent());
         })
         .catch(error => {
            console.error('Error updating records:', error);
        });
  
   }
}