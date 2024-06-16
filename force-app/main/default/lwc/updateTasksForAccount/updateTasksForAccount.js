import { LightningElement, track } from 'lwc';

import getTaskrecords from '@salesforce/apex/updateTasksForAccountController.getTaskrecords';

export default class TaskManager extends LightningElement {
    @track tasks = [];

    handleAccountChange(event) {
        debugger;
        const accountId = event.detail.recordId;
        if (accountId) {
            // Fetch related tasks based on the selected Account
            this.fetchTasks(accountId);
        } else {
            // Clear tasks if no Account is selected
            this.tasks = [];
        }
    }

     fetchTasks(accountId){
        debugger;
        getTaskrecords({accId : accountId})
          .then((result) => {
            console.log("result===>"+JSON.stringify(result));
            this.tasks = result;
          }).catch((err) => {
            console.log("err===>"+JSON.stringify(err));
            this.error = err;
            this.showErrorToast('Error', 'Error updating the record');
          });
    }

}