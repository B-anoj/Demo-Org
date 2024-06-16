import { LightningElement } from 'lwc';
export default class Childcustomevent1 extends LightningElement {
    name='';
    hadlelclick(event){
        this.name=this.target.value;
    
    const pevent=new CustomEvent("passdata",{detail: this.name});
    this.dispatchEvent(pevent);
}
}