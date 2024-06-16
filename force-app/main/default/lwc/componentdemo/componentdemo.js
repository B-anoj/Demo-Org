import { LightningElement,track } from 'lwc';
import conmeth from '@salesforce/apex/condatademo.conmeth';
export default class Componentdemo extends LightningElement {
   @track intnName;
   @track getDateOfBirth;
   @track getAddress;

    getFullName(event){
        this.intnName = event.target.value;
    }

    getDateOfBirth(event){
        this.dob = event.target.value;
    }

    getAddress(event){
        this.address = event.target.value;
    }

    SaveInteraction(){
        let dobDate = new Date(this.dob);
        conmeth({fullName : this.intnName, dob : dobDate, address : this.address})
        .then(result => {
            if(result){
                const evt = new ShowToastEvent({
                    title : 'Status',
                    message : 'The Rcord is insert successfully',
                    variant : 'success',
                    mode : 'dismissable'

                });
                this.dispatchEvent(evt);
                this.intnName = '';
                this.dobDate = '';
                this.address = '';
            }else{
                const evt = new ShowToastEvent({
                    title : 'Status',
                    message : 'The Rcord is failed to insert',
                    variant : 'error',
                    mode : 'dismissable'

                });
                this.dispatchEvent(evt);
            }
        })
    }

}