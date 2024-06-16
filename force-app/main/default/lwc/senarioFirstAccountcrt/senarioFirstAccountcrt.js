import { LightningElement, track, api, wire } from 'lwc';
import cretaccrecord from '@salesforce/apex/scenariofirstAccountcontroller.cretaccrecord';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import ROLE_FIELD from '@salesforce/schema/Account.Role__c';

export default class SenarioFirstAccountcrt extends LightningElement {
    @api recordId;
    @track Name;
    @track Phone;
    @track Role;
    @track error;
    @track actrec;
    @track options = [];

    // Fetch object info to use in picklist value retrieval
    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    debugger;
    accountObjectInfo;

    // Fetch picklist values for the Role__c field
    @wire(getPicklistValues, { recordTypeId: '$accountObjectInfo.data.defaultRecordTypeId', fieldApiName: ROLE_FIELD })
    debugger;
    rolePicklistValues({ error, data }) {
        if (data) {
            this.options = data.values;
        } else if (error) {
            this.error = error;
        }
    }

    handleNameChange(event) {
        debugger;
        this.Name = event.target.value;
    }

    handlePhoneChange(event) {
        debugger;
        this.Phone = event.target.value;
    }

    handleChange(event) {
        debugger;
        this.Role = event.detail.value;
    }

    createAccount() {
        debugger;
        cretaccrecord({
            recId: this.recordId,
            Name: this.Name,
            Phone: this.Phone,
            Role: this.Role
        })
        .then(result => {
            this.actrec = result;
        })
        .catch(error => {
            this.error = error;
        });
    }
}