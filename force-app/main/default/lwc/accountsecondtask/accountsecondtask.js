import { LightningElement,track } from 'lwc';
import getaccount from '@salesforce/apex/gettingallaccrecord.getaccdata';
export default class Accountsecondtask extends LightningElement {

    @track accounts=[];
    @track error;
    @track offset=0;
    result;

    connectedCallback() {
        this.LoadAccount();
    }

    LoadAccount(){
        getaccount({offset:this.offset})
        .then(result=>{
            this.accounts=accounts;

        })

        .catch(error=>{
            this.error=error;

        });
    }
        handleClick(){
            this.offset +=15;
            this.LoadAccount();
        }


}