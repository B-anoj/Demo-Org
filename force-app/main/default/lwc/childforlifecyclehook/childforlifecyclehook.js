import { LightningElement, api } from 'lwc';
export default class Childforlifecyclehook extends LightningElement {
    @api message;
    //constructor called

    constructor() {
        debugger;
        super();
        console.log('Child Constructor Called!!!!');
    }

    //Connected Callback

    connectedCallback() {
        console.log('Child connectedcallback=====>');
    }


    //render callback
    renderedCallback() {
        console.log('Child renderedCallback=====>');
    }

     //Disconnectedcallback
    disconnectedCallback() {
        console.log('child Disconnectedcallback=====>');
    }
}