import { LightningElement, track } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import getPricebookEntry from '@salesforce/apex/SearchPricebookEntryHandler.getPricebookEntry';
import getPricebookEntryDefault from '@salesforce/apex/SearchPricebookEntryHandler.getPricebookEntryDefault';
import createOpportunityLineItem from '@salesforce/apex/SearchPricebookEntryHandler.createOpportunityLineItem';

const columns = [
    { label: 'Product Name', fieldName: 'Name' },
    { label: 'ProductCode', fieldName: 'ProductCode' },
    { label: 'Unit Price', fieldName: 'UnitPrice' }
];

export default class ProductCreatedunderOpportunityLineItem extends LightningElement {
    @track searchkey;
    @track dataList = [];
    @track columns = columns;
    @track error;
    @track selectedPricebookEntries = [];
    @track showDataTable = false;

    handelchange(event){
        debugger;
        this.searchkey = event.target.value;
        this.handlePricebookEntries();
        this.connectedCallback();
    }

     @track OppLineItemToInsert=[];
     handleQuantityChange(event) {
        debugger;
        let entryId = event.target.dataset.id; 
        let quantity = event.target.value;
        var tempList = [];
       for(var i=0;i<this.selectedPricebookEntries.length;i++){
           if(this.selectedPricebookEntries[i].Id == entryId){
             var tempObj = {
                 PriceBookEntryId : entryId,
                 OpportunityId:'0065g00000aLY77AAG',
                 quantity : quantity,
                 Product2Id:this.selectedPricebookEntries[i].Product2Id,
                 TotalPrice:this.selectedPricebookEntries[i].UnitPrice,
             };
            tempList.push(tempObj);
           }
           this.OppLineItemToInsert=tempList;
       }
       console.log('tempList == >'+tempList);
    }

        connectedCallback() {
        debugger;
        getPricebookEntryDefault()
        .then(result =>{
        if(result){
            this.dataList = result;
        }
        })
        .catch(error =>{
            this.error = error;
        })
    }

    // connectedCallback() {
    //     debugger;
    //     getPricebookEntryDefault()
    //     .then(result => {
    //         if(result){
    //             this.dataList = result.map(entry =>({
    //         Id:entry.Id,
    //         Product2Id: entry.Product2Id,
    //         Name:entry.Product2.Name,
    //         ProductCode:entry.Product2.ProductCode,
    //         UnitPrice: entry.UnitPrice,
    //     }));
    //         }
    //     })
    //     .catch(error => {
    //         this.error = error;
    //     });
    // }

    handlePricebookEntries(){
        debugger;
        getPricebookEntry({ pname: this.searchkey })
        .then(result => {
            this.dataList = result;
        })
        .catch(error => {
            this.error = error;
        });
    }

    showSelectedRecords() {
        debugger;
        const selectedRecords = this.template.querySelector("lightning-datatable").getSelectedRows();
        if (selectedRecords.length > 0) {
            this.selectedPricebookEntries = selectedRecords;
        }
    }

    showSelectedRec() {
        debugger;
        this.showDataTable = true;
    }

    createOpportunityLineItemsAndClosePopup() {
    debugger;
    createOpportunityLineItem({pbentrylist:this.OppLineItemToInsert})
        .then(result =>{
        if(result){
            this.dataList = result;
            this.showDataTable = false;
        }
        })
        .catch(error =>{
            this.error = error;
        })

    }


    // createOpportunityLineItemsAndClosePopup() {
    //     debugger;
    //     this.showDataTable = false;
    // }
}