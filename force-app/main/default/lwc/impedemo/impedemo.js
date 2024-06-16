import { LightningElement,track } from 'lwc';
import acountdata from '@salesforce/apex/impclass.getacc';
export default class Impedemo extends LightningElement {
    @track acclst;
    @track error;
    handleClick(){
        acountdata()
        .then(result=>{
             this.acclst=result;
             console.log('Check data===>',this.acclst); 
             })
             
             
        .catch(error=>{
            this.error=error;});
          console.log('Check data===>',this.error);   


    }
   


}