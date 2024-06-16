import { LightningElement,api,wire } from 'lwc';
import getAccountList from '@salesforce/apex/accountrelatedlist.getAccountList';
import getContacts from '@salesforce/apex/accountrelatedlist.getContacts';

 const columns = [
        { label: 'First Name', fieldName: 'firstName' },
        { label: 'Last Name', fieldName: 'lastName' },
        { label: 'Phone Number', fieldName: 'phone'},
        { label: 'Email Address', fieldName: 'email'}
    ];
    
export default class Accountrelatedlist extends LightningElement {

    @api recordId
    @wire(getAccountList, { accountId: "$recordId" })
  wiredRecordsMethod({ error, data }) {
    if (data) {
      this.data = data;
      this.error = undefined;
    } else if (error) {
      this.error = error;
      this.data = undefined;
    }

    }

}