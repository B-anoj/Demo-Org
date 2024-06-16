import { LightningElement ,wire} from 'lwc';
import {publish,MessageContext} from 'lightning/messageService';
import COUNTING_UPDATED_CHANNEL from '@salesforce/messageChannel/MyMessageChannel__c';

export default class Publwc extends LightningElement {
    @wire(MessageContext) messageContext;
    handelIncrement(){
        const payload={
            operator:'add',
            constant:1
        };
        publish(this.messageContext ,COUNTING_UPDATED_CHANNEL, payload)

    } 
    handelDecrement(){
        const payload={
            operator:'substract',
            constant:1
        }
        publish(this.messageContext ,COUNTING_UPDATED_CHANNEL, payload)
    }
    handelMultiply(){
        const payload={
            operator:'multiply',
            constant:2
        };
        publish(this.messageContext ,COUNTING_UPDATED_CHANNEL, payload)

    }
}