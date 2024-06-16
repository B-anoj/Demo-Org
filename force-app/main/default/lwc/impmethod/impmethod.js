import { LightningElement,track } from 'lwc';
import getaccount from '@salesforce/apex/accounthelper.lsaccount';
export default class Impmethod extends LightningElement {
  

@track accountls;
@track error;

handleClick(){
    getaccount()
    .then(result=>{
       this.accountls=result;
    })

    .catch(error=>{
          this.error=error;
    });
}


}