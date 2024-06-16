import { LightningElement,wire } from 'lwc';
import getContact from '@salesforce/apex/QuerycontactLightningDtatablecontroller.getContact';
export default class QuerycontactLightningDtatable extends LightningElement {
    contacts;
    error;
    columns = [
        {label: 'First Name', fieldName: 'FirstName', type: 'text'},
        {label: 'LastName', filedName: 'LastName', type: 'text'},
        {label: 'Email', fieldName: 'Email', type: 'email'}
    ]

    @wire (getContact) wireContacts({data,error}){
        debugger;
    if(data){
        this.contacts = data;
    }
    else if(error){
        this.error = error;
    }
    }
}