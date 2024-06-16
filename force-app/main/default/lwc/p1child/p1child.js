import { LightningElement } from 'lwc';
export default class P1child extends LightningElement {
    name;
  handelchange(event){
      this.name=event.target.value;

      const pevent=new CustomEvent("passdata",{detail:this.name});
      this.dispatchEvent(pevent);
  }
}