import { LightningElement,wire,track } from 'lwc';
import meht from '@salesforce/apex/seraccountdata.meht';
export default class Accountsearching extends LightningElement {
@track searchkey;
@wire (meht,{searchText: '$searchkey'})accounts;

handleChange(event){
    this.searchkey=event.target.value;
}

}