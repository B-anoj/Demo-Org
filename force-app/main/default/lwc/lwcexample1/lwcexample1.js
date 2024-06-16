import { LightningElement } from 'lwc';

export default class Lwcexample1 extends LightningElement {

    name='Banoj';
    callme(Event){
        this.name="Hellow welcome to lwc";
    }
    listname(event)
    {
        this.name=event.target.value;
    }
}