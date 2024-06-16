import { LightningElement, wire, api } from "lwc";
import { refreshApex } from "@salesforce/apex";
import { updateRecord } from "lightning/uiRecordApi";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

import opmethod from "@salesforce/apex/OpportunityHandler.opmethod";

const COLS = [
  {
    label: "Name",
    fieldName: "Name",
    editable: true,
  },
  {
    label: "StageName",
    fieldName: "StageName",
    editable: true,
  },
  {
    label: "CloseDate",
    fieldName: "CloseDate",
    type: "Date",
    editable: true,
  },
];

export default class Datatabletask6 extends LightningElement {
    columns = COLS;
    draftValues = [];
    opportunities;

    // @wire(opmethod)
    // opmethod({data,error}){
    //     debugger;
    //     if(data){
    //         this.opportunities = data;
    //         console.log('this.opportunities===>'+JSON.stringify(this.opportunities));
    //     }
    //     else if(error){
    //         this.opportunities =error;
    //     }
    // }

     @wire(opmethod)opportunities;

    // Handle the save event from lightning-datatable
    handleSave(event) {
        debugger;
        const recordInputs = event.detail.draftValues.map(draft => {
            const fields = Object.assign({}, draft);
            return { fields };
        });

        const promises = recordInputs.map(recordInput =>
            updateRecord(recordInput)
        );

        Promise.all(promises)
            .then(() => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Record updated successfully',
                        variant: 'success'
                    })
                );
                // Clear draft values after successful save
                this.draftValues = [];
                // Refresh the Apex wire to get updated data
                return refreshApex(this.opportunities);
            })
            .catch(error => {
                // Handle error and display toast message
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error updating record',
                        message: error.body.message,
                        variant: 'error'
                    })
                );
            });
    }
}