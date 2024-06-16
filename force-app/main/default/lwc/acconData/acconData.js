import { LightningElement } from 'lwc';
import getAccounts from '@salesforce/apex/GetaccAndCondetails.deleteContacts';
import getContacts from '@salesforce/apex/GetaccAndCondetails.getContacts';
import { deleteRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';

export default class AcconData extends LightningElement {
    accCols = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Id', fieldName: 'Id' }
    ];
    AccData;
    conCols = [
        { label: 'First Name', fieldName: 'FirstName' },
        { label: 'Last Name', fieldName: 'LastName' },
        { label: 'Phone Number', fieldName: 'Phone'}
    ];
    conData;

    loadAccdata(){
        getAccounts().then(result=>{
            this.AccData=result;
            console.log(this.AccData);
        }).catch(error=>{
            console.log(error);
        });
    }
   getConrecords(event){
            alert(event.target.value);
        getContacts({accid : event.target.value}).then(result=>{
            this.conData=result;
            console.log(this.conData);
        }).catch(error=>{
            console.log(error);
        });
    }
   handleDeleteCon(){
        var selectedRecords =  this.template.querySelector("lightning-datatable").getSelectedRows();
      if(selectedRecords.length > 0){
          console.log('selectedRecords are ', selectedRecords);
          selectedRecords.forEach(currentItem => {
              deleteRecord(currentItem.Id).then(()=>{alert('Account deleted successfully')})
                                        .catch(()=>{alert('deltetonfailed')});
          });
    }
    
    refreshApex(this.getConrecords);
} 
handlecancel(event){
    this.conData=false;
}

}