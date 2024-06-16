import { LightningElement,wire } from 'lwc';
import getmethod from '@salesforce/apex/wire4.getmethod'
export default class Wire4 extends LightningElement {
    @wire(getmethod)lead;
}