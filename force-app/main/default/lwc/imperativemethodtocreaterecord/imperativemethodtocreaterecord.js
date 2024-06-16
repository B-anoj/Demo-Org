import { LightningElement } from 'lwc';
import imperativemeth from '@salesforce/apex/Imperativemethodtocreaterecord.imperativemeth';
export default class Imperativemethodtocreaterecord extends LightningElement {
    accountIds;
    accountnames;
    accountphones;
    changename(event){
        this.accountnames=event.target.value;
    }
    changephone(event){
        this.accountphones=event.target.value;
    }

    handleClick(){
        imperativemeth({accountnames:this.accountnames,accountphones:this.accountphones})
    
        .then(result =>{      
          this.accountIds=result[0].Id;

         })
         .catch(error=>{
         })

    }

}