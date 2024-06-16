import { LightningElement,api,track } from 'lwc';
import creteopprecord from '@salesforce/apex/scenariofirstOpportunitycontroller.creteopprecord';
export default class SenarioFirstOpportunitycrt extends LightningElement {
    @api recordId;
    @track Name;
    @track StageName;
    @track error;
    @track opps;

    handleNameChange(event) {
        debugger;
        this.Name= event.target.value;
    }
    handleStageNameChange(event) {
        debugger;
        this.StageName = event.target.value;
    }
    createOpportunity() {
        debugger;
        creteopprecord({
            recId: this.recordId,
            Name:this.Name,
            StageName:this.StageName
             })
        .then(result => {
            this.opps = result; // 'Id' should be capitalized
        })
        .catch(error => {
            this.error = error;
        });
    }

}