import { LightningElement,api } from 'lwc';
export default class ChildComponent extends LightningElement {

// Property name
@api itemname="Salesforce start";

//--Method name

@api handelchangevalue(){
    this.itemname="salesforce lwc demo";
}
}