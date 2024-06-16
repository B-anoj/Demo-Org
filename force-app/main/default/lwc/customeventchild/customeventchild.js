import { LightningElement } from 'lwc';
export default class Customeventchild extends LightningElement {
    name=''
    handelclick(event){
        this.name=event.target.value;

     const pevent=new CustomEvent("passdata",{detail:this.name});
        this.dispatchEvent(pevent); 
      }
}