import { LightningElement, track } from 'lwc';
import primaryTemplate from './parentforlifecyclehook.html';
import secondaryTemplate from './template2.html';

export default class Parentforlifecyclehook extends LightningElement {

    @track greeting;
    @track isrender = false;
    @track error;
    @track stack;

   @track messageFromParent = 'Hello from Parent';




    //Constructor called

    constructor() {
        debugger;
        super();
        console.log('parent Constructor Called!!!!');
    }

    //Connected Callback

    connectedCallback() {
        console.log('parent connectedcallback=====>');
    }


    //render callback
    renderedCallback() {
        console.log('parent renderedCallback=====>');
    }

    //render
    render() {
        debugger;
        console.log('parent renderer=====>');
        //return this.isrender ? secondaryTemplate : primaryTemplate;
        if(this.isrender == true){
           return secondaryTemplate;
        }
        else{
            return primaryTemplate;
        }
    }

    
    //Disconnectedcallback
    disconnectedCallback() {
        console.log('parent Disconnectedcallback=====>');
    }

    //Error callback
    errorCallback(error, stack) {
        console.log('error callback call==>')
        this.error = error;
        this.stack = stack;
    }

    changetemplate2(event) {
        debugger;
        this.greeting = event.target.value;
        this.isrender = true;
    }


}