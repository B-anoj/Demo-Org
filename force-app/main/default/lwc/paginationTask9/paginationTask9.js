import { LightningElement,wire } from 'lwc';
import getcontactList from '@salesforce/apex/accountapex.getcontactList';
export default class PaginationTask9 extends LightningElement {
    Conlist = [];
    error;
    visibleContacts;

//    connectedCallback() {
//        debugger;
//         this.fetchcontactRecord();
//     }

    @wire(getcontactList)
    wiredContacts({ error, data }) {
        if (data) {
            this.Conlist = data;
        } else if (error) {
            this.error = error;
            console.error('Error fetching contact records', this.error);
        }
    }

    updateContactHandler(event){
        this.visibleContacts = [...event.detail.records]
        console.log(event.detail.records);
    }
}