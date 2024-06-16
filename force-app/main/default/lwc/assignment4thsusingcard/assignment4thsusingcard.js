import { LightningElement, wire } from 'lwc';
import getContact from '@salesforce/apex/QuerycontactLightningDtatablecontroller.getContact';

export default class Assignment4thsusingcard extends LightningElement {
    contacts;

    @wire(getContact)
    wiredContacts({ error, data }) {
        if (data) {
            this.contacts = data;
        } else if (error) {
            console.error('Error fetching contacts:', error);
        }
    }
}