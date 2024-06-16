import { LightningElement,wire } from 'lwc';
import getaccount from '@salesforce/apex/Accounthandler.getaccount';
    
export default class Wiredemo1 extends LightningElement {

    //call the apex method name and html function name
     @wire (getaccount) accounts;
     
}