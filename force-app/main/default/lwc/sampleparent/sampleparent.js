import { LightningElement,track,api } from 'lwc';

export default class Sampleparent extends LightningElement {

    @track studentNamefromchild;
    
    handleCarNameChange(event){
       this.template.querySelector('c-samplechild').messageToDisplay(event.target.value);
    }

    handelMessagefromchild(event){
      this.studentNamefromchild=event.detail;
    }
}