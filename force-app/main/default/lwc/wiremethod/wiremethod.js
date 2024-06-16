import { LightningElement,wire,track,api } from 'lwc';
import getcon from '@salesforce/apex/accouuntwiremethod.getcon';
import USER_ID_FIELD from '@salesforce/schema/Account.OwnerId';
import { refreshApex } from '@salesforce/apex';
import { updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
 


const PAGE_SIZE = 20;
const RATING_VALUES = [ { label: 'Hot', value: 'Hot' },  
                        { label: 'Warm', value: 'Warm' }, 
                        { label: 'Cold', value: 'Cold' }];
    console.log(RATING_VALUES);                    


export default class Wiremethod extends LightningElement {
   

@track columns = [
  { label: 'Name', fieldName: 'Name', editable: true },
  { label: 'Phone', fieldName: 'Phone', editable: true },
  { label: 'Custom Date Field', fieldName: 'DATE_FIELD__c', type: 'date', editable: true },
  //{ label: 'Rating', fieldName: 'Rating', type: 'picklist', editable: true, options: RATING_VALUES },
 
  { label: 'Account Owner', fieldName: 'Owner.Name', type: 'lookup', editable: true,
   typeAttributes: { object: 'User', label: 'Name', placeholder: 'Select User'} 
   } ,

   {label: 'Rating', fieldName: 'Type', type: 'picklistColumn', editable: true, typeAttributes: {
            placeholder: 'Choose Type', options: { fieldName: 'pickListOptions' },
            value: { fieldName: 'Type' }, // default value for picklist,
            context: { fieldName: 'Id' } // binding account Id with context variable to be returned back
        }
    }  
];


    @api recordId;  
    @track accountList=[];
    @track rowOffset = 0;
    @track isNextDisabled = false;
    @track isPreviousDisabled = true;
    error;
    accountList2=[];
    columns2;

   
   

    @wire (getcon,{rowOffset: '$rowOffset'})accountList({error,data}){//here we can write anything instaed of accountlist.
        if(data){
            this.accountList=data;
            console.log('this.account record are:',this.accountList);
            
        }
        else if(error){
            this.error=error;
            console.log('this.error record are:',this.error);
        }
    }

    handleNext() {
        this.rowOffset += PAGE_SIZE;
        //this.updateButtons();
        //console.log(hiii);
    }

    handlePrevious() {
        this.rowOffset -= PAGE_SIZE;
        //this.updateButtons();
    }

     updateButtons() {
    /*if (this.rowOffset <= 0) {
        this.isPreviousDisabled = true;
    } else {
        this.isPreviousDisabled = false;
    }
    if (this.rowOffset + PAGE_SIZE >= this.accountList.totalItemCount) {
        this.isNextDisabled = true;
    } else {
        this.isNextDisabled = false;
    }*/
  }
  @track rid;
  @track isopen = false;
  draftValues = [];
  getSelectedRecords(event) {
    const selectedRows = event.detail.selectedRows;
    this.accountList2 = selectedRows;
    this.isopen = true;
  }

  getSelectedRecords(event) {
    const selectedRows = event.detail.selectedRows;
    this.accountList2 = selectedRows;
    this.isopen = true;
  }
 handleSave(event) {
     //alert('hooooooo');
     console.log('Save button clicked');
    const recordInputs =  event.detail.draftValues.slice().map(draft => {
        const fields = Object.assign({}, draft);
        return { fields };
    });

    console.log('recordInputs',recordInputs);

    const promises = recordInputs.map(recordInput => updateRecord(recordInput));
    Promise.all(promises).then(() => {
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'Records updated',
                variant: 'success'
            })
        );
        this.draftValues = [];
        return refreshApex(this.accountList);
    }).catch(error => {
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Error updating or refreshing records',
                message: error.body.message,
                variant: 'error'
            })
        );
    });
}

}