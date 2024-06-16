import { LightningElement,wire,track } from 'lwc';
import getconlist from '@salesforce/apex/conwire.getconlist';
import getcon from '@salesforce/apex/conwire.getcont';
const columns = [ { label: 'FirstName', fieldName: 'FirstName', sortable: "true"},
                  { label: 'LastName', fieldName: 'LastName', sortable: "true"},
                  { label: 'Phone', fieldName: 'Phone', type: 'phone', sortable: "true"},
                  { label: 'Email', fieldName: 'Email', type: 'email', sortable: "true" },];

export default class Wire6 extends LightningElement {    
   
    //@wire(getconlist) contact

    
   @wire(getcon)
    contacts(result) {
        if (result.data) {
            this.data = result.data;
            this.error = undefined;
        } else if (result.error) {
            this.error = result.error;
            this.data = undefined;
        }
    }
}