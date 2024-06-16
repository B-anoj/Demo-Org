import { LightningElement,wire } from 'lwc';
import {subscriber,messageContext} from 'lightning/messageService';
import banojdata from '@salesforce/messageChannel/lmsdemo__c';
export default class Lmssub extends LightningElement {
    publisherMessage='';
    subscription=null;

    @wire(messageContext)messageContext;

    connectedCallback() {
        this.handelsubscribe()
    }


    handelsubscribe(){
         if (this.subscription) {
            return;
        }
        this.subscription=subscriber(this.messageContext,banojdata,(message)=>{
        console.log(message.message);
        this.publisherMessage = message.message;
        });
    }

}