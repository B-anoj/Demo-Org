import { LightningElement,track,wire } from 'lwc';
import {currentpagereference} from 'lightning/navigation';
import {registerListener, unregisterAllListeners} from 'c/pubsub';
export default class Subcomp1 extends LightningElement {
    @track details;
    @wire (currentpagereference) pageref;

    connectedCallback() {
         registerListener('eventdetails',this.handelEvent, this);
    }
    handelEvent( details){
        this.details=details
    }
    disconnectedCallback() {
        unregisterAllListeners(this);
    }

}