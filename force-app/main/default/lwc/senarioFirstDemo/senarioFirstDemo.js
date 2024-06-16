import { LightningElement, track ,api} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import cretrecord from '@salesforce/apex/scenariofirstrController.cretrecord';

export default class SenarioFirstDemo extends LightningElement {
    @api recordId;
    @track firstName;
    @track lastName;
    @track company;
    @track email;
    @track phone;
    @track error;
    @track led;

    handleFirstNameChange(event) {
        debugger;
        this.firstName = event.target.value;
    }
    handleLastNameChange(event) {
        debugger;
        this.lastName = event.target.value;
    }
    handleCompanyChange(event) {
        debugger;
        this.company = event.target.value;
    }
    handleEmailChange(event) {
        debugger;
        this.email = event.target.value;
    }
    handlePhoneChange(event) {
        debugger;
        const phoneRegex = /^\d{10,12}$/; 
        const enteredPhone = event.target.value;
        
        if (phoneRegex.test(enteredPhone)) {
            this.phone = enteredPhone;
            this.error = ''; 
        } else {
            this.error = 'Phone should be 10-12 digits';
        }
    }
    createLead() {
        debugger;
        const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

        if (!emailRegex.test(this.email)) {
            this.error = 'Enter a valid email address';
            return;
        }
        cretrecord({
            recId: this.recordId,
            FirstName:this.firstName,
            LastName:this.lastName,
            Company: this.company,
            Email:this.email,
            Phone:this.phone,
        })
        .then(result => {
            this.led = result; 
            const event = new ShowToastEvent({
                title: 'Success',
                message: 'Record created successfully',
                variant: 'success',
            });
            this.dispatchEvent(event);
        })
        .catch(error => {
            this.error = error;
            const event = new ShowToastEvent({
                title: 'Error creating record',
                message: error.body.message, 
                variant: 'error',
            });
            this.dispatchEvent(event);
        });
    }
}