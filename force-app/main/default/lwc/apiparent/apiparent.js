import { LightningElement } from 'lwc';
export default class Apiparent extends LightningElement {
parentvar;

    handleMessage(event){
    debugger;
    this.parentvar = this.template.querySelector('c-apichild').itemname;
    
    }

    handleClick(){
        debugger;
        this.parentvar = this.template.querySelector('c-apichild').meth();
    }

}