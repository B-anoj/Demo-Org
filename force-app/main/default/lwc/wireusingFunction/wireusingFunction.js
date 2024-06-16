// WireusingFunction.js
import { LightningElement, wire, track } from 'lwc';
import getacclist from '@salesforce/apex/Wireusingfunction.getacclist';

export default class WireusingFunction extends LightningElement {
    @track accounts;
    @track error;

    @wire(getacclist)
    wiredAccounts({ error, data }) {
        if (data) {
            this.accounts = data;
            this.error = undefined; // Reset error if data is received
        } else if (error) {
            this.error = error;
            this.accounts = undefined; // Reset accounts if there's an error
        }
    }
}