import { LightningElement } from 'lwc';
export default class Lifecyclehook extends LightningElement {

   
    connectedCallback() {
        console.log('In connected callback');
    }
 constructor(){
        super();
        console.log('In constructor ')
    }
}