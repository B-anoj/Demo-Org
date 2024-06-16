import { LightningElement , wire } from 'lwc';

import getaccount from '@salesforce/apex/WireBinding.getaccount';
export default class WireBinding extends LightningElement {

accounts;
error;
@wire(getaccount)
wiredAccounts({error,data}){
    if(data){
        this.accounts=data;
        this.error=undefined;
    }
    else if(error){
        this.error=error;
        this.accounts=undefined;
    }
}
//    connectedCallback() {
//         this.loadAccounts();
//     }

//     loadAccounts() {
//         getAccount()
//             .then(data => {
//                 this.accounts = data;
//                 this.error = undefined;
//             })
//             .catch(error => {
//                 this.error = error;
//                 this.accounts = undefined;
//             });
//     }
}