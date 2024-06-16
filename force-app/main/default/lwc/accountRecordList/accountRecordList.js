import { LightningElement,wire } from 'lwc';
import getAccounts from '@salesforce/apex/accountcontroller.getAccounts';
export default class AccountRecordList extends LightningElement {
    @wire(getAccounts) accounts;
    accountidfrmparent;
    handleClick(event) {
        event.preventDefault();
        this.accountidfrmparent = event.target.dataset.accountid;
    }

}