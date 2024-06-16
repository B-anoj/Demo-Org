import { LightningElement,track } from 'lwc';
export default class Trackdecorator extends LightningElement {
    @track counter=0;
    handelclick(){
        this.counter++;
    }

}