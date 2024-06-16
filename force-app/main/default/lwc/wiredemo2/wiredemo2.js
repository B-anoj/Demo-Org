import { LightningElement,wire } from 'lwc';
import opmethod from'@salesforce/apex/OpportunityHandler.opmethod';
export default class Wiredemo2 extends LightningElement {
   @wire(opmethod) Opportunity;
}