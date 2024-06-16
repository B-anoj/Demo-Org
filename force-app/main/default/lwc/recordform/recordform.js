import { LightningElement,api } from 'lwc';
import OBJEC_NAME from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';

export default class Recordform extends LightningElement {
    @api recid;
    objectApiName= OBJEC_NAME;
 name =NAME_FIELD;
 revenue=REVENUE_FIELD;
 industry=INDUSTRY_FIELD;
   
    fields = [NAME_FIELD, REVENUE_FIELD, INDUSTRY_FIELD];
    handleSubmit(event){
        console.log('Account detail : ',+event.detail.fields);
        console.log('Account name : ',+event.detail.fields.Name);
    }

}