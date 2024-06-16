import { LightningElement,api,wire } from 'lwc';
import getcontactbyaccountid from '@salesforce/apex/contactalldata.getcontactbyaccountid';

import { CurrentPageReference } from 'lightning/navigation';
import { deleteRecord } from 'lightning/uiRecordApi';
export default class Contactlist extends LightningElement {
    columns =  [
        { label: 'First Name', fieldName: 'FirstName' },
        { label: 'Last Name', fieldName: 'LastName'},
        { label: 'Email', fieldName: 'Email', type: 'email' },    
    ];
    @api recordId;
    @api accountId;
    @wire(getcontactbyaccountid,{accountId:'$accountId'}) contacts;

     deleteme(event)
    {
        deleteRecord(this.recordId).then(response=>{
             // Navigate to the Account home page
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'home',
            },
        });
        }).catch(error=>{})
    } 

     getSelectedRec() {
      var selectedRecords =  this.template.querySelector("lightning-datatable").getSelectedRows();
      if(selectedRecords.length > 0){
          console.log('selectedRecords are ', selectedRecords);
 
          let ids = '';
          selectedRecords.forEach(currentItem => {
              ids = ids + ',' + currentItem.Id;
              deleteRecord(currentItem.Id);
              //deleteRecord(currentItem.Id).then({});
          });
          this.selectedIds = ids.replace(/^,/, '');
          this.lstSelectedRecords = selectedRecords;
          alert(this.selectedIds);
          alert(hi);
        deleteRecord(this.selectedIds);
 alert(hi);
      }   
}  
 


}