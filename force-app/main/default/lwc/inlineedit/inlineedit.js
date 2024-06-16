import { LightningElement,track } from 'lwc';
export default class Inlineedit extends LightningElement {
   
    @track contacts = [
        { Id: '001', Name: 'John Doe', Email: 'john.doe@example.com', Phone: '555-555-5555' },
        { Id: '002', Name: 'Jane Smith', Email: 'jane.smith@example.com', Phone: '555-555-5556' },
        { Id: '003', Name: 'Bob Johnson', Email: 'bob.johnson@example.com', Phone: '555-555-5557' }
    ];

    isEditable(contactId, fieldName) {
        return this.editableFields && this.editableFields[contactId] === fieldName;
    }

    handleBlur(event) {
        const editedValue = event.target.innerText;
        const contactId = event.target.parentNode.getAttribute('key');
        const fieldName = event.target.getAttribute('contenteditable');

        // Update the contacts array with the edited value
        const editedContact = this.contacts.find(contact => contact.Id === contactId);
        editedContact[fieldName] = editedValue;

        // Remove the editableFields property to indicate that editing is complete
        delete this.editableFields[contactId];

        // Re-render the table
        this.contacts = [...this.contacts];
    }
}