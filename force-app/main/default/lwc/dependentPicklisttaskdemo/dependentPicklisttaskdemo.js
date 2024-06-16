import { LightningElement,wire, api, track  } from 'lwc';
import {getObjectInfo} from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import {getPicklistValues} from 'lightning/uiObjectInfoApi';
import State_FIELD  from '@salesforce/schema/Account.State__c';
import COUNTRY_FIELD  from '@salesforce/schema/Account.Country__c';
 
export default class DependentPicklisttaskdemo extends LightningElement {
    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT })
    accountInfo;
    @track stateOptions;
    @track countryOptions;
    @track country;
    // @track countryFieldData;

    @wire(getPicklistValues, {recordTypeId: '$accountInfo.data.defaultRecordTypeId', fieldApiName: State_FIELD })
    StateFieldInfo({ data, error }) {
        debugger;
        if (data) this.stateFieldData = data;
    }

    @wire(getPicklistValues, {recordTypeId:'$accountInfo.data.defaultRecordTypeId', fieldApiName: COUNTRY_FIELD })
    countryFieldInfo({ data, error }) {
        debugger;
        if (data) this.countryOptions = data.values;
    }

    handleContinentChange(event) {
        debugger;
        let key = this.stateFieldData.controllerValues[event.target.value];
        this.stateOptions = this.stateFieldData.values.filter(opt => opt.validFor.includes(key));
    }

    
}