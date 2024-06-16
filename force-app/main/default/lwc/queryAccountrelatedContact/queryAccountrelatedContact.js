import { LightningElement,wire } from 'lwc';
import getaccountrelatedcont from '@salesforce/apex/QueryAccountrelatedContactController.getaccountrelatedcont';
export default class QueryAccountrelatedContact extends LightningElement {
    accounts;
    error;
    @wire (getaccountrelatedcont)WiredAccount({error,data}){
        debugger;
        if(data){
            this.accounts = data;
        }
        else if(error){
            this.error = error;
        }
    }
}