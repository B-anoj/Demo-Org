import { LightningElement,wire } from 'lwc';
import getacc from '@salesforce/apex/wire17_12.getacc';
export default class Wire17_12 extends LightningElement {
    @wire(getacc) account;
}