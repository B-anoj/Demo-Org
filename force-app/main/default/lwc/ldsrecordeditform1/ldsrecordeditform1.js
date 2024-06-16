import { LightningElement,api } from 'lwc';

import namefield from '@salesforce/schema/Account.Name';
import phone from '@salesforce/schema/Account.Phone';
import annualrevenue from '@salesforce/schema/Account.AnnualRevenue';

export default class Ldsrecordeditform1 extends LightningElement {
   @api recordId;
   @api objectApiName;

   afield=[namefield,phone,annualrevenue];
   handelsubmit(event){
       console.log('Account Name',event.detail.fields.Name);

   }
}