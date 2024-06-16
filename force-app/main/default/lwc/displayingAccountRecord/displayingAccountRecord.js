import { LightningElement } from 'lwc';
import getAccountList from '@salesforce/apex/accountrelatedlist.getAccountList';

const accountColumns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Phone', fieldName: 'Phone' },
];

const contactColumns = [
    {label : 'FirstName', fieldName: 'FirstName'},
    {label : 'Phone', fieldName: 'Phone'},
];
export default class DisplayingAccountRecord extends LightningElement {

}