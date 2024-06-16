import { LightningElement, wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts';

export default class QuerycontactCustomAccordion extends LightningElement {
    contacts = [];
    activeSectionMessage = '';

    @wire(getContacts)
    wiredContacts({ error, data }) {
        if (data) {
            this.contacts = data;
        } else if (error) {
            console.error('Error fetching contacts:', error);
        }
    }

    handleToggleSection(event) {
        this.activeSectionMessage = 'Open section name: ' + event.detail.openSections;
    }

    handleSetActiveSectionC() {
        const accordion = this.template.querySelector('.example-accordion');
        accordion.activeSectionName = 'C'; // Change the active section name to 'C'
    }
}