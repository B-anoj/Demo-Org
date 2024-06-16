import { LightningElement,api } from 'lwc';
export default class Spinner extends LightningElement {
     @api isloaded = false;
     handleClick(){
         this.isloaded=!this.isloaded;
     }
}