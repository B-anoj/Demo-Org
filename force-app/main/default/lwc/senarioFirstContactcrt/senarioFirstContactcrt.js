import { LightningElement,track,api } from 'lwc';
import cretconrecord from '@salesforce/apex/scenariofirstContactcontroller.cretconrecord';

export default class SenarioFirstContactcrt extends LightningElement {
    @api recordId;
    @track firstName;
    @track lastName;
    @track email;
    @track error;
    @track contct;

    handleFirstNameChange(event) {
        debugger;
        this.firstName = event.target.value;
    }
    handleLastNameChange(event) {
        debugger;
        this.lastName = event.target.value;
    }
    handleEmailChange(event) {
        debugger;
        this.email = event.target.value;
    }
    createContact() {
        debugger;
        cretconrecord({
            recId: this.recordId,
            FirstName:this.firstName,
            LastName:this.lastName,
            Email: this.email
        })
        .then(result => {
            this.contct = result; // 'Id' should be capitalized
        })
        .catch(error => {
            this.error = error;
        });
    }
}