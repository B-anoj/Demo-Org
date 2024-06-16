import { LightningElement } from 'lwc';
export default class EventDeclaratively extends LightningElement {
   inchandler(event){ 
        //step 1--->create event / With data
        const inc=new CustomEvent('increase',{detail:'vol control'});

        //step-2--->Dispatch or fire event /with data
        this.dispatchEvent(inc);

    }
    dechandler(event){
        //single step we can do
        this.dispatchEvent(new CustomEvent('decrease',{detail:'banoj'}));

    }

}