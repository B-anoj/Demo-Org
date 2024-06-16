import { LightningElement } from 'lwc';
export default class Childhook1 extends LightningElement {
    constructor(){
        super();
        console.log('chld constructor call');
    }
    connectedCallback(){
        console.log('child connected callback');
    }
    renderedCallback(){
        console.log('child render callback');
    }
    
}