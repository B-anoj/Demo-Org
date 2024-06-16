import { LightningElement, track } from 'lwc';
export default class Recordpicker extends LightningElement {
   @track id;
    isChild = false;
    handleChange(event) {
        debugger;
        console.log(event.detail.recordId);
        //this.id = event.detail.recordId;
        const accountId = event.detail.recordId;
        if(accountId){
            this.id=accountId;
            this.isChild = true;
        }else{
            this.isChild = false;
        }
    }
}