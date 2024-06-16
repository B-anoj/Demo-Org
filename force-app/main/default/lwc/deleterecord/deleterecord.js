import { LightningElement ,api} from 'lwc';
import {deleteRecord, DeleteRecord} from 'lightning/uiRecordApi';
import { CurrentPageReference } from 'lightning/navigation';

export default class Deleterecord extends LightningElement {
    @api recordId; //---->It is a predefiend ID.
    
    deleteme(event)
    {
        deleteRecord(this.recordId).then(response=>{
             // Navigate to the Account home page
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'home',
            },
        });
        }).catch(error=>{})
    }
}