import { LightningElement, track, wire } from 'lwc';
import { updateRecord } from "lightning/uiRecordApi";
import getAccounts from '@salesforce/apex/TaskController.getAccounts';
import getRelatedTasks from '@salesforce/apex/TaskController.getRelatedTasks';

const accountColumns = [
        {label: 'Account Name', fieldName: 'Name' , type: 'text'},
        { label: 'Account Phone', fieldName: 'Phone', type: 'Phone' },

    ];
    const taskColumns = [
        {label: 'Task Subject', fieldName: 'Subject' , type: 'text',editable: true},
        { label: 'Task Phone', fieldName: 'Phone', type: 'Phone' ,editable: true}
    ];
export default class TaskManagementTask8 extends LightningElement {
    accounts = [];
    error;
    accountColumns = accountColumns;

    tasks = [];
    taskColumns = taskColumns;
    selectedAccountId = null;
    draftValues = [];

    @wire(getAccounts)
    wiredAccounts({ error, data }) {
        if(data){
            this.accounts = data;
        }
        else if(error){
            this.error = error;
            console.error('Error retrieving accounts', this.error);
        }
    }

    handleRowSelection(event) {
        debugger;
        const selectedRows = event.detail.selectedRows;
        if (selectedRows.length > 0) {
            this.selectedAccountId = selectedRows[0].Id;
            this.loadRelatedTask();
        } else {
            this.selectedAccountId = null;
            this.loadRelatedTask = [];
        }
    }

    loadRelatedTask(){
        debugger;
        getRelatedTasks({accountId : this.selectedAccountId})
        .then((result) => {
            this.tasks = result;
            console.log('Result is====>' +this.tasks);
        }).catch((error) => {
             console.error('Error retrieving related contacts', error);
        });
    }

     
}