import { LightningElement,wire } from 'lwc';
import getcon from '@salesforce/apex/contactrangedata.getcon';
export default class Contactrangedata extends LightningElement {
    @wire(getcon) Account;
    handleClick(event){
         this.event.target.value.Account;
    }

}