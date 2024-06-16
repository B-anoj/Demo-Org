import { LightningElement } from 'lwc';
export default class Parentcustomevent1 extends LightningElement {
    cname1='';
   handelclick(event){
        this.cname1=event.detail;
        console.log(event.detail)
    }

}