import { LightningElement,wire } from 'lwc';
import getAccounts from '@salesforce/apex/Assignment5th.getAccounts';
export default class Assignment5thsusingcard extends LightningElement {
  
    accounts;
    @wire(getAccounts)
    wiredAccounts({ error, data }) {
        if (data) {
            this.accounts = data;
        } else if (error) {
            console.error('Error fetching accounts:', error);
        }
    }
}