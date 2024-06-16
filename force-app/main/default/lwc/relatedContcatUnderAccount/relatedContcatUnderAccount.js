import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/accountCreationControllerLwc.getAccounts';
import getRelatedContacts from '@salesforce/apex/accountCreationControllerLwc.getRelatedContacts';

const accountColumns = [
    { label: 'Account Name', fieldName: 'Name', type: 'text' },
     { label: 'Account Phone', fieldName: 'Phone', type: 'Phone' }
];

const contactColumns = [
    { label: 'Contact Name', fieldName: 'Name', type: 'text' },
    { label: 'Email', fieldName: 'Email', type: 'email' },
];

export default class RelatedContcatUnderAccount extends LightningElement {
    accounts = [];
    accountColumns = accountColumns;
    relatedContacts = [];
    contactColumns = contactColumns;
    selectedAccountId = null;

    @wire(getAccounts)
    wiredAccounts({ error, data }) {
        if (data) {
            this.accounts = data;
        } else if (error) {
            console.error('Error retrieving accounts', error);
        }
    }

    handleRowSelection(event) {
        debugger;
        const selectedRows = event.detail.selectedRows;
        if (selectedRows.length > 0) {
            this.selectedAccountId = selectedRows[0].Id;
            this.loadRelatedContacts();
        } else {
            this.selectedAccountId = null;
            this.relatedContacts = [];
        }
    }

    loadRelatedContacts() {
        debugger;
        getRelatedContacts({ accountId: this.selectedAccountId })
            .then(data => {
                this.relatedContacts = data;
            })
            .catch(error => {
                console.error('Error retrieving related contacts', error);
            });
    }
}