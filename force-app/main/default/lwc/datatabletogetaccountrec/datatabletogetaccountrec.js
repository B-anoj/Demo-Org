import { LightningElement } from 'lwc';
import getaccounts from '@salesforce/apex/Getaccountdatatablerec.getmethod';

    columns = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Phone', fieldName: 'Phone' },
        { label: 'Email', fieldName: 'Email' }
    ];
export default class Datatabletogetaccountrec extends LightningElement {
    columns=columns;
    accData(event){
            alert(event.target.value);
        getaccounts({accid : event.target.value}).then(result=>{
            this.conData=result;
            console.log(this.conData);
        }).catch(error=>{
            console.log(error);
        });
    }


}