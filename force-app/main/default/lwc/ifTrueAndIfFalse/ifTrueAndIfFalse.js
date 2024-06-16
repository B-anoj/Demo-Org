import { LightningElement } from 'lwc';
export default class IfTrueAndIfFalse extends LightningElement {
    showText = false;
    handleClick(){
        this.showText=true;
    }
}