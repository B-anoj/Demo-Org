import { LightningElement } from 'lwc';
import createaccount from '@salesforce/apex/accounthelper.createaccount';
export default class Impmethodcreateaccountrecord extends LightningElement {
  Accountname;
  error;
  accountid;
handelname(event){
  this.Accountname=event.target.value;
}

handleClick(){
    createaccount({cname:this.Accountname})

    .then(result =>{
   this.AccountId=result[0].Id;
   console.log(this.accountid);
    })

    .catch(error=>{
        //this.error=error;
    });
}
}