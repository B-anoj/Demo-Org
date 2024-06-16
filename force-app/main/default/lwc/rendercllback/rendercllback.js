import { LightningElement } from 'lwc';
export default class Rendercllback extends LightningElement {
    constructor(){
    super()
    console.log('I am in constructor');
    }
    connectedCallback() {
        //code
        console.log('I am in rendercallback');
    }
    Rendercllback(){
        console.log('child component rendercallback from parent component');
    }
    disconnectedCallback() {
        console.log('I am in disconnect callback');
    }

}