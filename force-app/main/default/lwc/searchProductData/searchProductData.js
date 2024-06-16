import { LightningElement,track,wire} from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import getProduct from '@salesforce/apex/SearchProductHandler.getProduct';
import getProductDefault from '@salesforce/apex/SearchProductHandler.getProductDefault';

const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'ProductCode', fieldName: 'ProductCode' } 
];



export default class SearchProductData extends NavigationMixin(LightningElement)  {
@track searchkey;
//@track data = [];
@track dataList = [];
@track selectedRows = [];
@track selectedIds = '';
@track columns = columns;
@track error;
@track selectedProduct=[];
@track showDataTable = false;

handelchange(event){
debugger;
   this.searchkey=event.target.value;
   this.handleProducts();
   this.connectedCallback();

}
connectedCallback() {
    debugger;
    getProductDefault()
    .then(result =>{
       if(result){
           this.dataList = result;
       }
    })
    .catch(error =>{
        this.error = error;
    })
}

handleProducts(){
    debugger;
    getProduct({pname:this.searchkey}).then((result) => {
        this.dataList = result;
    }).catch((err) => {
        this.error = err;
    });
}

// showSelectedRecords() {
//       var selectedRecords =  this.template.querySelector("lightning-datatable").getSelectedRows();
//       if(selectedRecords.length > 0){
//           console.log('selectedRecords are ', selectedRecords);
 
//           let ids = '';
//           selectedRecords.forEach(currentItem => {
//               ids = ids + ',' + currentItem.Id;
//           });
//           this.selectedIds = ids.replace(/^,/, '');
//           this.lstSelectedRecords = selectedRecords;
//           alert(this.selectedIds);
//       } 
// } 


    showSelectedRecords() {
        debugger;
        const selectedRecords = this.template.querySelector("lightning-datatable").getSelectedRows();
        if (selectedRecords.length > 0) {
            this.selectedProduct = selectedRecords;
            
            // let ids = '';
            // selectedRecords.forEach(currentItem => {
            //     ids = ids + ',' + currentItem.Id;
            // });
            // this.selectedIds = ids.replace(/^,/, '');

            // if (this.selectedIds) {
            //     this[NavigationMixin.Navigate]({
            //         type: 'standard__webPage',
            //         attributes: {
            //             url: '/apex/AnotherPageName?selectedIds=' + this.selectedIds
            //         }
            //     });
            // }
        }
    }

    showSelectedRec(){
        debugger;
        this.showDataTable = true;
    }

    closePopup() {
        // Logic to close the popup
        this.showDataTable = false;
    }
}