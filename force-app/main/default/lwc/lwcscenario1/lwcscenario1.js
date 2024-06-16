import { LightningElement, track, api } from 'lwc';  
import getAccounts from '@salesforce/apex/lwcscenario.getAccounts';
import createAccount from '@salesforce/apex/lwcscenario.createAccount';
import deleteAccount from '@salesforce/apex/lwcscenario.deleteAccount';   
import { createRecord } from 'lightning/uiRecordApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Lwcscenario1 extends LightningElement {
    @track draftValues = [];
    
    @track accountList = [];

    columns = [
        { label: 'Name', fieldName: 'Name', type: 'text', editable: true,required: true },
        { label: 'Phone', fieldName: 'Phone', type: 'phone', editable: true },
        { label: 'Rating', fieldName: 'Rating', type: 'text', editable: true },
        { label: 'Industry', fieldName: 'Industry', type: 'text', editable: true,required: true },
        { type: 'button', typeAttributes: { iconName: 'utility:add', name: 'addRow', title: 'Add Row' } },
        { type: 'button', typeAttributes: { iconName: 'utility:delete', name: 'deleteRow', title: 'Delete Row', title: 'Delete Selected' } }    
        // { type: 'button', typeAttributes: { iconName: 'utility:delete', name: 'deleteSelected', title: 'Delete Selected' } }

    ];


   /*  connectedCallback() {
        // Load initial account data
        this.loadAccounts();
    }

    loadAccounts() {
        // Call the Apex method to retrieve account data
        getAccounts()
            .then(result => {
                this.accountList = result;
            })
            .catch(error => {
                console.error('Error loading accounts:', error);
            });
    }
*/
     
    handleRowAction(event) {
        const action = event.detail.action;
        const row = event.detail.row;

        switch (action.name) {
            case 'addRow':
                this.handleAddRow();
                break;
            case 'deleteRow':
                this.handleDeleteRow(row.Id);
                break;
            case 'deleteSelected':
            this.handleDeleteSelected();
            break;    
        }
    }

    handleDeleteSelected() {
    const selectedRows = this.template.querySelector('lightning-datatable').getSelectedRows();
    if (selectedRows.length > 0) {
        const rowIds = selectedRows.map(row => row.Id);
        this.accountList = this.accountList.filter(account => !rowIds.includes(account.Id));
    }
    }

    handleAddRow() {
        let newAccount = { Name: '', Phone: '', Rating: '', Industry: '' };
        this.accountList = [...this.accountList, newAccount];
    }

    handleDeleteRow(rowId) {
        //this.accountList = this.accountList.filter(account => account.Id !== rowId);
    }

    handleSave(event) {
        const nonEmptyAccounts = this.accountList.filter(account => {
        return account.Name || account.Phone || account.Rating || account.Industry;
    });

     console.log('Save button clicked');
        const updatedFields = event.detail.draftValues;
        let promises = [];
        console.log(updatedFields);

        updatedFields.forEach((account) => {
            if(account.id!=''){
                let record = {
                apiName: ACCOUNT_OBJECT.objectApiName,
                fields: {
                    Name: account.Name,
                    Phone: account.Phone,   
                    Rating: account.Rating,
                    Industry: account.Industry
                }
            };
            promises.push(createRecord(record));
            }
            
        });

        Promise.all(promises)
            .then((results) => {
        let insertedAccounts = [];
        results.forEach((result) => {
            let insertedAccount = {
                Id: result.id,
                Name: result.fields.Name.value,
                Phone: result.fields.Phone.value,
                Rating: result.fields.Rating.value,
                Industry: result.fields.Industry.value
            };
            insertedAccounts.push(insertedAccount);
        });
        this.accountList = [...nonEmptyAccounts, ...insertedAccounts];
        })
        .catch((error) => {
                console.log('sucess+++++ records failed'+error);
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error updating records',
                        message: error.body.message,
                        variant: 'success'
                    })
                );
            })
            .finally(() => {
                // Clear the draft values
                this.draftValues = [];
            });
    }

}