import { LightningElement , wire } from 'lwc';

import getaccount from '@salesforce/apex/AccountDateHandler.getaccount';
export default class WireDemoForAccount extends LightningElement {


@wire(getaccount)accounts;
}