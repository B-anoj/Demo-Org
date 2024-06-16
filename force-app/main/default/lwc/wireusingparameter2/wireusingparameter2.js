import { LightningElement,track,wire } from 'lwc';
import findcontacts from '@salesforce/apex/wireusingparameter2.findcontacts';
export default class Wireusingparameter2 extends LightningElement {
    @track searchkey;
    contactlist;
    error;
    @wire (findcontacts,{searchtext:'$searchkey'})contacts(data, error){
        if(data){
            this.contactlist=data;
            console.log(this.contactlist);
        }
        else if(error){
            this.error=error;
            console.log('error'); 
        }
    }
    handelchange(event){
        this.searchkey=event.target.value; 
    }
}