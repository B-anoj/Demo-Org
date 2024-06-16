import { LightningElement,wire } from 'lwc';
import { refreshApex } from '@salesforce/apex';
import { NavigationMixin } from 'lightning/navigation';
import getOpportunities from '@salesforce/apex/oppreq.getOpportunities'; 

export default class OppRequest extends LightningElement {
     data;
    error;

       columns = [
        { label: 'Opportunity Name', fieldName: 'Name', type: 'text' },
        { label: 'City', fieldName: 'City__c', type: 'Text' },
        { label: 'School Name', fieldName: 'School_Name__c', type: 'Text' },
        { label: 'ClassroomID', fieldName: 'Classroom_ID__c', type: 'Id' },

        // Add the custom "New Opportunity" button column
        {
            type: 'button',
            typeAttributes: {
                label: 'Apply',
                name: 'new_opportunity',
                title: 'Create New Opportunity',
                disabled: false,
                value: 'new_opportunity',
                iconPosition: 'left',
            },
        },
    ];

    @wire(getOpportunities)
    wiredOpportunities({ error, data }) {
        if (data) {
            this.data = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.data = undefined;
        }
    }

   handleRowAction(event) {
    const action = event.detail.action;
    const row = event.detail.row;
    if (action.name === 'new_opportunity') {
        console.log('Apply button clicked for Opportunity:', row.Name);
        // Add any additional logic here if needed for the button action
        this.openApplicationForm(row);
        
    }
}


    createNewOpportunity() {
        // Use the NavigationMixin to navigate to the new Opportunity creation page
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Opportunity_Request__c',
                actionName: 'new',
            },
        });
    }

    refreshTable() {
        return refreshApex(this.wiredOpportunities);
    }


}