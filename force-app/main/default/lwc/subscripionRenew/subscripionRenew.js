import { LightningElement, api, wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { encodeDefaultFieldValues } from 'lightning/pageReferenceUtils';
import getFirstSubscriptionId from '@salesforce/apex/SubscriptionController.getFirstSubscriptionId';

export default class SubscripionRenew extends NavigationMixin(LightningElement) {
    @api recordId;
    data;

    // connectedCallback() {
    //      debugger;
    //     setTimeout(() =>{
    //         this.navigateToNewRecordWithDefaults();
    //     }, 300);

    //     // Call the method to fetch Subscription ID and navigate
    //     //this.fetchSubscriptionIdAndNavigate();
    // }

    // fetchSubscriptionIdAndNavigate() {
    //     debugger;
    //     getFirstSubscriptionId({ recId: this.recordId })
    //         .then(result => {
               
    //                 this.data = result;
    //                 this.navigateToNewRecordWithDefaults();
                
    //         })
    //         .catch(error => {
    //             console.error('Error fetching Subscription ID:', error);
    //         });
    // }

    navigateToNewRecordWithDefaults() {
        debugger;
           console.log(this.recordId);
        const defaultValues = encodeDefaultFieldValues({
         
            Subscription__Id : this.recordId, // Prepopulating the lookup field
        });

        console.log(defaultValues);

        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Subscription_Renewal_History__c',
                actionName: 'new'
            },
            state: {
                defaultFieldValues: defaultValues
            }
        });
    }
}