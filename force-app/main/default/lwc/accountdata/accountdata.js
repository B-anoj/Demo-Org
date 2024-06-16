import { LightningElement,wire } from 'lwc';
import getaccdata from '@salesforce/apex/accoundatacol.getaccdata'
export default class Accountdata extends LightningElement {
    
    @wire(getaccdata)account;

}