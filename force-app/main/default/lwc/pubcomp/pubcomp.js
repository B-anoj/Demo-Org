import { LightningElement, wire } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import { fireEvent } from 'c/pubsub';

export default class pubcomp extends LightningElement {
     @wire(CurrentPageReference) pageRef;
    handleChanges(event){
        fireEvent(this.pageRef, 'inputChangeEvent', event.target.value);
    }
}