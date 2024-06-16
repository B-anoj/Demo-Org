import { LightningElement,wire } from 'lwc';
import getdata from '@salesforce/apex/saerchingdata.getdata'
export default class Searchcmp extends LightningElement {
handelchange(){
    this.search=event.target.value;
}

    @wire(getdata)Account;


}