import { LightningElement,wire,api, track } from 'lwc';
import getAccounts from '@salesforce/apex/relatedRelatedtask3handler.getAccounts';
import getOpportunity from '@salesforce/apex/relatedRelatedtask3handler.getOpportunity';

const accountColumns = [
    { label: 'Account Name', fieldName: 'Name', type: 'text' },
     { label: 'Account Phone', fieldName: 'Phone', type: 'Phone' }
];

const contactColumns = [
    { label: 'Opportunity Name', fieldName: 'Name', type: 'text' },
    { label: 'Amount', fieldName: 'Amount', type: 'Currency' },
];

export default class RelatedRecordtask3 extends LightningElement {
    accounts = [];
    accountColumns = accountColumns;
    relatedContacts = [];
    contactColumns = contactColumns;
    selectedAccountId = null;


     @wire(getAccounts)
    wiredAccounts({ error, data }) {
        if (data) {
            this.accounts = data.map(account => ({ ...account, Id: account.Id }));
        } else if (error) {
            console.error('Error retrieving accounts', error);
        }
    }

    handleRowSelection(event) {
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
        getOpportunity({ accountId: this.selectedAccountId })
            .then(data => {
                this.relatedContacts = data.map(contact => ({ ...contact, Id: contact.Id }));
            })
            .catch(error => {
                console.error('Error retrieving related contacts', error);
            });
    }
}