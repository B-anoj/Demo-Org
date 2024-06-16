import { LightningElement } from 'lwc';
export default class VolunteerApplicationForm extends LightningElement {
    volunteerName = '';
    volunteerEmail = '';

    handleNameChange(event) {
        this.volunteerName = event.target.value;
    }

    handleEmailChange(event) {
        this.volunteerEmail = event.target.value;
    }

    handleApply() {
        // Emit a custom event with the entered data to the parent component (OppRequest)
        const applyEvent = new CustomEvent('apply', {
            detail: {
                volunteerName: this.volunteerName,
                volunteerEmail: this.volunteerEmail,
            },
        });
        this.dispatchEvent(applyEvent);
    }
}