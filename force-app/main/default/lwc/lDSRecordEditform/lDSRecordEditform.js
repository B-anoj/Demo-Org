import { LightningElement,api } from 'lwc';

export default class LDSRecordEditform extends LightningElement {
    @api recordId;
    @api objectApiName;

    Cancelme(event)
    {
        const inputField = this.template.querySelectorAll('lightning-input-field');
        inputFields.forEach(field=>{field.reset();});
    }
    
}