import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class CreateOpportunity extends NavigationMixin(LightningElement) {
    connectedCallback() {
        this.navigateToOpportunityPage();
    }

    navigateToOpportunityPage() {
        const defaultValues = {
            Name: 'Jiyash',
        };

        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Contact',
                actionName: 'new'
            },
            state: {
                defaultFieldValues: JSON.stringify(defaultValues)
            }
        });
    }
}