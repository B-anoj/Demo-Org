import { LightningElement,wire,track } from 'lwc';
import getcon from '@salesforce/apex/impdemocls.meth';
export default class Impdemo2 extends LightningElement {
    @track contacts;
    @track error;
    handleClick(){
        getcon()
        .then(result=>{
            this.contacts=result;
        })  
        .catch(error=>{
        this.error=error;
        })
    }

}