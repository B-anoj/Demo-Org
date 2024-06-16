import { LightningElement, api, track, wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import cretconrecord from '@salesforce/apex/scenariofirstContactcontroller.cretconrecord';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import ROLE_FIELD from '@salesforce/schema/Contact.Role__c';

export default class DynamicFormBasedonPicklistValuetask4 extends LightningElement {
    @api recordId;
    @track firstName;
    @track lastName;
    @track email;
    @track error;
    @track contct;
    @track role;
    value = '';
    @track options = [];

    handleFirstNameChange(event) {
        this.firstName = event.target.value;
    }
    handleLastNameChange(event) {
        this.lastName = event.target.value;
    }
    handleEmailChange(event) {
        this.email = event.target.value;
    }
    handleChange(event) {
        this.value = event.detail.value;
    }

    @wire(getObjectInfo, { objectApiName: CONTACT_OBJECT })
    debugger;
    objectInfo;

    @wire(getPicklistValues, { fieldApiName: ROLE_FIELD })
    debugger;
    wiredRoleData({ error, data }) {
        if (data) {
            this.options = data.values.map(item => ({ label: item.label, value: item.value }));
        } else if (error) {
            console.error('Error in Role picklist field', JSON.stringify(error));
        }
    }

    createContact() {
        cretconrecord({
            recId: this.recordId,
            FirstName: this.firstName,
            LastName: this.lastName,
            Email: this.email,
            Role: this.value
        })
        .then(result => {
            this.contct = result;
        })
        .catch(error => {
            this.error = error;
        });
    }
}