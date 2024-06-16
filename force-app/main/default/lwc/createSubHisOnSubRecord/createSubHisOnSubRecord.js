import { LightningElement,api } from 'lwc';
import { CloseActionScreenEvent } from 'lightning/actions';
export default class CreateSubHisOnSubRecord extends LightningElement {
    @api recordId;
    defaultParentId;
    connectedCallback(){
        debugger;
        setTimeout(() =>{
this.defaultParentId = this.recordId;
        }, 300);
   }   
handleSuccess(event) {
    debugger;
        console.log('onsuccess event recordEditForm',event.detail.id)
        this.dispatchEvent(new CloseActionScreenEvent());
    }
closeAction(){
    debugger;
  this.dispatchEvent(new CloseActionScreenEvent());
}
      handleSubmit(event) {
        event.preventDefault(); // Prevent default form submission
        this.template.querySelector('lightning-record-edit-form').submit();
    }
   
closeAction(){
     debugger;
  this.dispatchEvent(new CloseActionScreenEvent());
}
}