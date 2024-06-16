import { LightningElement,track,api,wire } from 'lwc';
import getContacts from '@salesforce/apex/duplicateaccountcls.getContacts';
import delSelectedcons from '@salesforce/apex/duplicateaccountcls.deleteContacts';
import { CloseActionScreenEvent } from 'lightning/actions';
import { refreshApex } from '@salesforce/apex';
// importing to show toast notifictions
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
// datatable columns
const columns = [
    {
        label: 'FirstName',
        fieldName: 'FirstName'
    }, {
        label: 'LastName',
        fieldName: 'LastName'
    }, {
        label: 'Phone',
        fieldName: 'Phone',
        
    }, {
        label: 'Email',
        fieldName: 'Email',
       
    }
];



export default class Duplicateaccountocontact extends LightningElement {
      // reactive variable
    @api recordId;
    @track columns= columns; //holds column info.
    @api searchKey='';
     // non-reactive variables
    selectedRecords = [];
    refreshTable;
    error;

closeAction(){
        this.dispatchEvent(new CloseActionScreenEvent());
    }

    // retrieving the data using wire service
result;
res;
@track page=1;

    @wire(getContacts,{accId:'$recordId',searchKey:'$searchKey'})
    contacts(result) {
        this.refreshTable = result;
        if (result.data) {
            this.res = result.data;
            this.result=this.res.slice(0,5);
            this.error = undefined;
        } else if (result.error) {
            this.error = result.error;
            this.data = undefined;
        }
    }
    // search functionality //
    handlechanged(event){
    this.searchKey=event.target.value;
    console.log("searchKey:"+JSON.stringify(this.searchKey))
    }
    

    
    previousHandler(){
        if(this.page>1){
            this.page=this.page-1;
            this.result=this.res.slice((parseInt(this.page)-1)*5,(parseInt(this.page))*5);
        }

    }
    nextHandler(){
        this.page=this.page+1;
        this.result=this.res.slice((parseInt(this.page)-1)*5,(parseInt(this.page))*5);
        if(this.result.length<1){
                this.previousHandler();
        }
       

    }
    // Getting selected rows 
    getSelectedRecords(event) {
        // getting selected rows
        const selectedRows = event.detail.selectedRows;
        // this set elements the duplicates if any
        let conIds = new Set();

        // getting selected record id
        for (let i = 0; i < selectedRows.length; i++) {
            conIds.add(selectedRows[i].Id);
        }
        // coverting to array
        this.selectedRecords = Array.from(conIds);
    }

    // delete records process function
    handleDeletecon() {
        if (this.selectedRecords) {
             delSelectedcons({lstConIds: this.selectedRecords})
        .then(result => {
            // showing success message
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success!!', 
                    message:' contacts are deleted.', 
                    variant: 'success'
                }),
            );
            // Clearing selected row indexs 
            this.template.querySelector('lightning-datatable').selectedRows = [];
            eval("$A.get('e.force:refreshView').fire();");
            // refreshing table data using refresh apex
            return refreshApex(this.refreshTable);

        })
        .catch(error => {
            window.console.log(error);
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error while getting contacts', 
                    message: error.message, 
                    variant: 'error'
                }),
            );
        });
        }
    }
      

}