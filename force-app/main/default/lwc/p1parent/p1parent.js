import { LightningElement } from 'lwc';
export default class P1parent extends LightningElement {
    childvalue;
handelchange(event){
  this.childvalue=event.detail;
}
}