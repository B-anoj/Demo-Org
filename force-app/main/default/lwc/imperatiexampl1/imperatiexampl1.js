import { LightningElement,track } from 'lwc';
import accountdata from '@salesforce/apex/imperativecls.getaccdata';
export default class Imperatiexampl1 extends LightningElement {
   @track accountname;
   result;
   error;
   AccounId;

    handelchange(event){
        this.accountname=event.target.value;
    }
    handleClick(){
        accountdata({cname : this.accountname})
        .then(result=>{
            this.AccounId=result[0].Id;
            console.log(this.AccounId);
        })


        .catch(error=>{

        });
    }

}