import { LightningElement, wire } from 'lwc';
import getAccount from '@salesforce/apex/LookupFieldHandler.getAccount';
import getContactsForAccount from '@salesforce/apex/LookupFieldHandler.getContactsForAccount';

const accountColumns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Phone', fieldName: 'Phone' },
];

const contactColumns = [
    { label: 'Contact Name', fieldName: 'Name' },
    { label: 'Email', fieldName: 'Email' },
];

export default class Lookupfield extends LightningElement {
    selectedAccount;
    accountData = [];
    contactData = [];
    accountColumns = accountColumns;
    contactColumns = contactColumns;

    handleAccountSelection(event) {
        const recordId = event.target.value;

        // Fetch and display account details
        this.getAccountDetails(recordId);

        // Fetch and display contacts belonging to the account
        this.getContactsForAccount(recordId);
    }

    getAccountDetails(recordId) {
        getAccount({ recordId })
            .then(result => {
                if (result.length > 0) {
                    this.selectedAccount = result[0];
                    this.accountData = [this.selectedAccount];
                } else {
                    this.selectedAccount = null;
                    this.accountData = [];
                }
            })
            .catch(error => {
                console.error('Error fetching account details', error);
            });
    }

    getContactsForAccount(accountId) {
        getContactsForAccount({ accountId })
            .then(result => {
                this.contactData = result;
            })
            .catch(error => {
                console.error('Error fetching contacts for account', error);
            });
    }
}