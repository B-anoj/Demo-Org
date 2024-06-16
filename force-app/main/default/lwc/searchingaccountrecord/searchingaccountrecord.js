import { LightningElement,wire,track } from 'lwc';
import getAccounts from '@salesforce/apex/accountcallparmeter.getAccounts';
export default class Searchingaccountrecord extends LightningElement {
     accountlist;
     error;
    @track sname;
    @wire (getAccounts,{cname: '$sname'}) account({error,data})
    {
               if(data)
               {
                   this.accountlist=data;
               }
               else if(error)
               {
                this.error=undefined;
               }
    };
    handleChange(event){
      this.sname = event.target.value;
      console.log('this.input value is',this.sname);
    }
     
}