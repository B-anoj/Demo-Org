import { LightningElement,api } from 'lwc';
import accname from '@salesforce/schema/Account.Name';
import phone from '@salesforce/schema/Account.Phone';

export default class Recordformexample extends LightningElement {
    @api recordId;
    @api objectApiName;

allfield=[accname,phone]
handelclick(event){
    console.log('the record is',this.target.fields.name);
}

}