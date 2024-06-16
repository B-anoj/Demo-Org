import { LightningElement } from 'lwc';
export default class Customdemoparent extends LightningElement {
    cname=''
   handelchange(event){
       this.cname=event.detail;
       console.log(this.cname);
   }

}