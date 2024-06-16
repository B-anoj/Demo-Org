import { LightningElement,api } from 'lwc';
export default class Apichild extends LightningElement {
    @api itemname='I am in child event';//api using property!

    @api meth(){ //api using Method!
    this.itemname='Message change by method';
    return this.itemname;
    }

}