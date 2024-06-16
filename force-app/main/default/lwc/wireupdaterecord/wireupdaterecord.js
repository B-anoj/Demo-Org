import { LightningElement,api } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import ID_FIELD from '@salesforce/schema/Account.Id';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import RATING_FIELD from '@salesforce/schema/Account.Rating';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import {updateRecord} from 'lightning/uiRecordApi';
export default class Wireupdaterecord extends LightningElement {
    @api recordId;
    name;
    industry;
    rating;
    nameChange(event){
        this.name=event.target.value;
    }
    ratingChange(event){
        this.industry=event.target.value;
    }
    industryChange(event){
        this.rating=event.target.value;

    }
    handleClick(){
        //4. map the data to the fields
        const fields ={};
        fields[ID_FIELD.fieldApiName]=this.recordId;
        fields[NAME_FIELD.fieldApiName]=this.name;
         fields[RATING_FIELD.fieldApiName]=this.rating;
        fields[INDUSTRY_FIELD.fieldApiName]=this.industry;
         const recordInput = {
      fields: fields
    };

        //6. Invoke the method updateRecord()
    updateRecord(recordInput).then((record) => {
      console.log(record);
    });
       
    }

}