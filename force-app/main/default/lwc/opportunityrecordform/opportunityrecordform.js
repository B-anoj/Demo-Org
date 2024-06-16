import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Opportunityrecordform extends LightningElement {
   
    handleSubmit(event) {
        event.preventDefault(); 
        const toastEvent = new ShowToastEvent({
            title: 'Success!',
            message: 'Record saved successfully.',
            variant: 'success',
        });
        this.dispatchEvent(toastEvent);
    }
}