import { LightningElement,api } from 'lwc';
import firsttemplate from './lifecyclehookdemo.html';
import secondtemplate from './lifecyclehook2.html';
export default class Lifecyclehookdemo extends LightningElement {
    @api templateno='temp1';
    constructor(){
        debugger;
        super();
        console.log('I am in inside constructor called');
    }
    connectedCallback() {
        debugger;
        let varelement=this.template;
        console.log('I am in connected callback=>'+varelement.isConnected);
    }
    disconnectedCallback() {
        debugger;
        console.log('I am in Inside disconnected callback');
    }
    changetemplate(){
        debugger;
        console.log('inside change template');
        if(this.templateno='temp1'){
            this.templateno='temp2';
        }
        else{
            this.templateno='temp1';
        }  
        
    }
    render(){
        debugger;
        console.log('inside render');
        if(this.templatenos=='temp1')
        return firsttemplate;
        else
        return secondtemplate;
    }
    rendercallback(){
        debugger;
        console.log('inside render callback');
    }
    errorCallback(error, stack) {
        debugger;
        console.log('inside error callback'+error);
        alert('error'+error);
    }
}