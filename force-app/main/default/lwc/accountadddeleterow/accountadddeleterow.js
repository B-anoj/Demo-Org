import { LightningElement, api, track, wire } from 'lwc';
import { CloseActionScreenEvent } from 'lightning/actions';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'
import fetchContacts from '@salesforce/apex/AccountAddDeleteRowHandler.fetchContacts';
import dmlOnContacts from '@salesforce/apex/AccountAddDeleteRowHandler.dmlOnContacts';
import { refreshApex } from '@salesforce/apex';
 
export default class Accountadddeleterow extends LightningElement {
    @api recordId;
    @track isLoading = true;
    @track records;
    wiredRecords;
    error;
    @track deleteConatctIds = '';
 
    //to close quick action
    closeAction(){
        this.dispatchEvent(new CloseActionScreenEvent());
    }
 
    //to add row
    addRow() {
        debugger;
        let randomId = Math.random() * 16;
        let myNewElement = {Email: "", FirstName: "", Id: randomId, LastName: "", AccountId: this.recordId};
        this.records = [...this.records, myNewElement];
    }
 
    get isDisable(){
        debugger;
        return (this.isLoading || (this.wiredRecords.data.length == 0 && this.records.length == 0));
    }
 
    //show/hide spinner
    handleIsLoading(isLoading) {
        this.isLoading = isLoading;
    }
 
    //update table row values in list
    updateValues(event){
        debugger;
        var foundelement = this.records.find(ele => ele.Id == event.target.dataset.id);
        if(event.target.name === 'FirstName'){
            foundelement.FirstName = event.target.value;
        } else if(event.target.name === 'LastName'){
            foundelement.LastName = event.target.value;
        } else if(event.target.name === 'Email'){
            foundelement.Email = event.target.value;
        }
    }
 
    //handle save and process dml 
    handleSaveAction(){
         debugger;
        if(this.handleCheckValidation()) {
            this.handleIsLoading(true);
     
            if(this.deleteConatctIds !== ''){
                this.deleteConatctIds = this.deleteConatctIds.substring(1);
            }
     
            this.records.forEach(res =>{
                if(!isNaN(res.Id)){
                    res.Id = null;
                }
            });
             
            dmlOnContacts({data: this.records, removeContactIds : this.deleteConatctIds})
            .then( result => {
                this.handleIsLoading(false);
                refreshApex(this.wiredRecords);
                this.updateRecordView(this.recordId);
                this.closeAction();
                this.showToast('Success', result, 'Success', 'dismissable');
            }).catch( error => {
                this.handleIsLoading(false);
                console.log(error);
                this.showToast('Error updating or refreshing records', error.body.message, 'Error', 'dismissable');
            });
        }
    }
 
    //remove records from table
    handleDeleteAction(event){
        debugger;
        if(isNaN(event.target.dataset.id)){
            this.deleteConatctIds = this.deleteConatctIds + ',' + event.target.dataset.id;
        }
        this.records.splice(this.records.findIndex(row => row.Id === event.target.dataset.id), 1);
    }
 
    //fetch account contact records
    @wire(fetchContacts, {recordId : '$recordId'})  
    wiredContact(result) {
        debugger;
        this.wiredRecords = result; // track the provisioned value
        const { data, error } = result;
 
        if(data) {
            this.records = JSON.parse(JSON.stringify(data));
            this.error = undefined;
            this.handleIsLoading(false);
        } else if(error) {
            this.error = error;
            this.records = undefined;
            this.handleIsLoading(false);
        }
    } 
 
    showToast(title, message, variant, mode) {
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant,
            mode: mode
        });
        this.dispatchEvent(event);
    }
 
    updateRecordView() {
        debugger;
       setTimeout(() => {
            eval("$A.get('e.force:refreshView').fire();");
       }, 3000); 
    }
 
    //added this method for validate input if any required
    handleCheckValidation() {
        debugger;
        let isValid = true;
        let inputFields = this.template.querySelectorAll('.fieldvalidate');
        inputFields.forEach(inputField => {
            if(!inputField.checkValidity()) {
                inputField.reportValidity();
                isValid = false;
            }
        });
        return isValid;
    }
}