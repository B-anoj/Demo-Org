import { LightningElement } from 'lwc';

import { NavigationMixin } from 'lightning/navigation';

import { encodeDefaultFieldValues } from 'lightning/pageReferenceUtils';

 

 

export default class NavToNewContactWithDefaultValues extends NavigationMixin(LightningElement) {

    connectedCallback() {
        //code

        const defaultValues = encodeDefaultFieldValues({

            FirstName: 'TestFName',

            LastName: 'TestLName'

       

        });

 

        console.log(defaultValues);

 

        this[NavigationMixin.Navigate]({

            type: 'standard__objectPage',

            attributes: {

                objectApiName: 'Contact',

                actionName: 'new'

            },

            state: {

                defaultFieldValues: defaultValues

            }

        });

    }

}