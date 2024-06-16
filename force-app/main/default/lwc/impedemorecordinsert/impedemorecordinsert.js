import { LightningElement } from 'lwc';
import accountdata from '@salesforce/apex/impreordinsert.getdata';
export default class Impedemorecordinsert extends LightningElement {
    accountname;
    AccountId;
    error;
    
    handelchange(){
        this.accountname=event.target.value;
    }
    handleClick(){
        accountdata({sname:this.accountname})
        .then(result=>{
            this.AccountId=result[0].Id;
            console.log(this.AccountId);
        })

        .catch(error=>{

        });


    }
    


}