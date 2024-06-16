import { LightningElement,api,track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';
import updateCase from '@salesforce/apex/UpdateRecordTask5handler.updateCase';
export default class UpdateRecordTask5 extends LightningElement {
    @api recordId;
    caseSubject;
    caseDescription;
    @track caseStatus;
    @track statusOptions = [
        { label: 'New', value: 'New' },
        { label: 'Working', value: 'Working' },
        { label: 'Escalated', value: 'Escalated' },
        { label: 'Closed', value: 'Closed' }]
    @track caseData;
    @track error;

    handelSubjectchange(event){
        debugger;
        this.caseSubject = event.target.value;
        console.log("this.caseSubject===>"+JSON.stringify(this.caseSubject));
    }

    handelDescriptionchange(event){
        debugger;
        this.caseDescription = event.target.value;
         console.log("this.caseDescription===>"+JSON.stringify(this.caseDescription));
    }

    handelStatuschange(event){
        debugger;
         this.caseStatus = event.target.value;
          console.log("this.caseStatus===>"+JSON.stringify(this.caseStatus));
    }

    handleUpdate(){
        debugger;
        updateCase({caseId : this.recordId,
          caseSubject :this.caseSubject,
          caseDescription :this.caseDescription,
          caseStatus :this.caseStatus  
          })
          .then((result) => {
              console.log("result===>"+JSON.stringify(result));
              this.caseData = result;
             this.showSuccessToast('Record Updated', 'Record updated successfully');
             return refreshApex(this.caseData);
          }).catch((err) => {
               console.log("err===>"+JSON.stringify(err));
               this.error = err;
               this.showErrorToast('Error', 'Error updating the record');
          });
    }
     showSuccessToast(title, message) {
        const evt = new ShowToastEvent({
            title: title,
            message: message,
            variant: 'success'
        });
        this.dispatchEvent(evt);
    }

    showErrorToast(title, message) {
        const evt = new ShowToastEvent({
            title: title,
            message: message,
            variant: 'error'
        });
        this.dispatchEvent(evt);
    }

}