import { LightningElement,api} from 'lwc';
import accountname from '@salesforce/schema/Account.Name';
import phone from '@salesforce/schema/Account.Phone';
import annualrevenue from '@salesforce/schema/Account.AnnualRevenue';
export default class Recordformdemo extends LightningElement {
    @api recordId;
    @api objectApiName;

    allfield=[accountname,phone,annualrevenue];

    hadelsubmit(event){
        console('the record is',this.detail.field.Name);
        //console('the record is',this.detail.field.phone);

    }

}