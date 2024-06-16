import { LightningElement,wire,track } from 'lwc';
import getProfileName from '@salesforce/apex/RefundController.getProfileName';
export default class Casecomp extends LightningElement {

     @track profileName;
     filter = {};

     handleChange(event){
        debugger;
        this.userdata = event.detail.recordId;
    }


     @wire(getProfileName)
    getProfileId({data,error}){
        debugger;
        if(data){
            this.profileName = data;
        }else if (error) {
            console.error('Error fetching states.....', error);
        }
    }


    
            filter = {
                criteria : [
                     {
                    fieldPath: 'Name',
                    operator: 'eq',
                    value:this.profileName,
                }
            ],
            };

}