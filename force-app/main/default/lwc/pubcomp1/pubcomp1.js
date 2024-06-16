import { LightningElement,wire } from 'lwc';
import {currentpagereference} from 'lightning/navigation';
import {fireEvent} from 'c/pubsub';
export default class Pubcomp1 extends LightningElement {
    @wire(currentpagereference) pageref;
    displayAnimal(event){
        fireEvent(this.pageref,'eventdetails',this.event.target);
    }
}