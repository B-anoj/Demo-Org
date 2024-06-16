import { LightningElement, wire } from 'lwc';
import { refreshApex } from '@salesforce/apex';
import { NavigationMixin } from 'lightning/navigation';
import getOpportunities from '@salesforce/apex/oppreq.getOpportunities';
import updateVolunteerDetails from '@salesforce/apex/oppreq.updateVolunteerDetails';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import VolunteerApplicationForm from 'c/volunteerApplicationForm';

const COLUMNS = [
    // ... Define your columns as needed ...
        { label: 'Opportunity Name', fieldName: 'Name', type: 'text' },
        { label: 'City', fieldName: 'City__c', type: 'Text' },
        { label: 'School Name', fieldName: 'School_Name__c', type: 'Text' },
        { label: 'ClassroomID', fieldName: 'Classroom_ID__c', type: 'Id' },

        {
            type: 'button',
            typeAttributes: {
                label: 'Apply',
                name: 'apply',
                title: 'Create New Opportunity',
                disabled: false,
                value: 'new_opportunity',
                iconPosition: 'left',
            },
        },
];

export default class ParentComponents extends NavigationMixin(LightningElement) {
    wiredOpportunitiesResult;
    error;
    showModal = false;
    selectedOpportunity;

    columns = COLUMNS;

    @wire(getOpportunities)
    wiredOpportunities({ error, data }) {
        if (data) {
            this.wiredOpportunitiesResult = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.wiredOpportunitiesResult = undefined;
        }
    }

    handleRowAction(event) {
        const action = event.detail.action;
        const row = event.detail.row;
        console.log('row' + JSON.stringify(row.Id));
        if (action.name === 'apply') {
            console.log('Apply button clicked for Opportunity:', row.Name);
            this.showModal = true;
            this.selectedOpportunity = row;
        }
    }

    handleApply(event) {
        // Handle the Volunteer's application data
        const { volunteerName, volunteerEmail } = event.detail;

        console.log('Volunteer Name:', volunteerName);
        console.log('Volunteer Email:', volunteerEmail);
        if (this.selectedOpportunity && volunteerName && volunteerEmail) {
        updateVolunteerDetails({ 
            oppId: this.selectedOpportunity.Id,
            volunteerName: volunteerName,
            volunteerEmail: volunteerEmail
        }).then(result => {
                console.log('Result:', result);
                const toastEvent = new ShowToastEvent({
                title: 'Success',
                message: 'Volunteer details updated successfully!',
                variant: 'success'
            });
            this.dispatchEvent(toastEvent);
            })
            .catch(error => {
                console.error('Error:', error);
            });
        }
         else {
            console.error('Invalid input values. All fields are required.');
            console.error('Invalid input values. All fields are required.');
            // Show a toast message for invalid input values
            const event = new ShowToastEvent({
                title: 'Error',
                message: 'Error : Invalid input values. All fields are required.',
                variant: 'error'
            });
            this.dispatchEvent(event);
        }
        // Close the popup window after applying
        this.showModal = false;
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.selectedOpportunity.Id,
                objectApiName: 'Opportunity_Request__c',
                actionName: 'view'
            }
        });
    }

      createNewOpportunity() {
        //NavigationMixin to navigate to the new Opportunity creation page
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Opportunity_Request__c',
                actionName: 'new',
            },
        });
    }
}