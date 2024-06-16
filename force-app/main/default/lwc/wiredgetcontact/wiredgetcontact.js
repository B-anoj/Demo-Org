import { LightningElement,wire,track } from 'lwc';
import getconlist from '@salesforce/apex/Getwirecontactrecord.getaccount'

const colm=[
    {label:'First Name',fieldName:'FirstName',type:'text'},
    {label:'Last Name',fieldName:'LastName',type:'text'},
    {label:'Phone',fieldName:'Phone',type:'Phone'},
    {label:'Email',fieldName:'Email',type:'email'},
];
export default class Wiredgetcontact extends LightningElement {
    @track col = colm;
    @wire(getconlist) banoj;
}