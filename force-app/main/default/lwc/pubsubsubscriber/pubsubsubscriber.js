import { LightningElement } from 'lwc';
import pubsub from 'c/pubsub'

export default class Pubsubsubscriber extends LightningElement {
    rmessage;

    connectedCallback() {
        this.registerListener();
    }

     registerListener(){
         pubsub.registerListener('eventnotify',this.callme.bind(this));
     }
     callme(messageFromEvt)
     {
         alert('hii'+messageFromEvt);
         this.rmessage = messageFromEvt ? JSON.stringfy(messageFromEvt,null,'\t') : 'No message in payload';
     }
}