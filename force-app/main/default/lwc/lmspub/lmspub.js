import { LightningElement ,wire} from 'lwc';
import {publish,messageContext} from 'lightning/messageService';
import banojdata from'@salesforce/messageChannel/lmsdemo__c';
export default class Lmspub extends LightningElement {

    @wire(messageContext)messageContext;

    message;

    handleChange(event){
        this.message=event.target.value;

    }

    handleClick(){
        let message={message:this.message};
        publish(this.messageContext,banojdata,message);
    }

}