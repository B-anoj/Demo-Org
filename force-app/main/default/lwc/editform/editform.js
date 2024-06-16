import { LightningElement,api } from 'lwc';
import accname from '@salesforce/schema/Account.Name';
import phone from '@salesforce/schema/Account.Phone';

export default class Editform extends LightningElement {
    @api recordId;
    @api objectApiName;

    allfield=[accname,phoneb];

    

}