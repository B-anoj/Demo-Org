import { LightningElement, wire } from 'lwc';
    
import getAccounts from '@salesforce/apex/Assignment5th.getAccounts';
export default class Assignment5ths extends LightningElement {

    columns = [
        { label: 'Account Name', fieldName: 'Name' },
        { label: 'Industry', fieldName: 'Industry' },
        { label: 'Type', fieldName: 'Type' }
    ];
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