import { LightningElement,wire,track } from 'lwc';
import accountdat from '@salesforce/apex/wireusingmethodcls.getmeth';
export default class Wireusingmethoddemo extends LightningElement {
    acclist;
    error;
    @track sname;

    @wire(accountdat,{bname:'$sname'}) accounts(error,data){
        if(data){
            this.acclist=data;
            console.log('the account data are',this.acclist);
        }
        else if(error){
            this.error=undefined;
            console.log('the error is',this.error);
        }
    };
     handelchange(event){
         this.sname=event.target.value;

        }

}