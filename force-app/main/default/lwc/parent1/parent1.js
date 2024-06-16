import { LightningElement } from 'lwc';
export default class Parent1 extends LightningElement {
  handleClick(){
        this.template.querySelector('c-child1').hadelchange();//Here handelchange is method name.
    }

}