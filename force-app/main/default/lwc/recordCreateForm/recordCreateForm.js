import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from "@salesforce/schema/Account";
import NAME_FIELD from "@salesforce/schema/Account.Name";
import PHONE_FIELD from "@salesforce/schema/Account.Phone";
export default class RecordCreateForm extends LightningElement {
     accountObject = ACCOUNT_OBJECT;
     myFields = [NAME_FIELD, PHONE_FIELD];

     handleAccountCreated(){
         
     }

}