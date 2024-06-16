import { LightningElement,wire } from 'lwc';

import getmethod from '@salesforce/apex/wire3.getmethod';

export default class Wire3 extends LightningElement {
    @wire (getmethod)contact;

}