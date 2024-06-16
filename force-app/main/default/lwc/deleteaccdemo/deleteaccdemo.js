import { LightningElement,wire,api } from 'lwc';
import accdata from '@salesforce/apex/deleterecacc.getacc';
import {deleteRecord} from 'lightning/uiRecordApi';
import {refershApex} from '@salesforce/apex';
export default class Deleteaccdemo extends LightningElement {

   
    @api currentrecordId;
    erorr;
    result;

    @wire(accdata)account;

    handelchange(){
        this.currentrecordId=event.target.value;
        console.log('current record id is',this.currentrecordId);
    }
    handleDelete(){
        deleteRecord(this.currentrecordId)
        
        .then((result)=>{
            return refershApex(this.account);
           
        })

        .catch(error=>{
            this.error=error;
            console.log('unable able to delete the recore due to'+JSON.stringify(this.error));

        });



    }
}