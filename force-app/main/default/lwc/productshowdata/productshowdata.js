import { LightningElement,track,wire} from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import getProduct from '@salesforce/apex/SearchProductHandler.getProduct';
import getProductDefault from '@salesforce/apex/SearchProductHandler.getProductDefault';

const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'ProductCode', fieldName: 'ProductCode' } 
];

 
export default class Productshowdata extends NavigationMixin(LightningElement) {
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
        this.showDataTable = true;
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

    closePopup() {
        // Logic to close the popup
        this.showDataTable = false;
    }
}


// Productshowdata.js (Parent Component)

// import { LightningElement, track, wire } from 'lwc';
// import { NavigationMixin } from 'lightning/navigation';
// import getProduct from '@salesforce/apex/SearchProductHandler.getProduct';
// import getProductDefault from '@salesforce/apex/SearchProductHandler.getProductDefault';

// const columns = [
//     { label: 'Name', fieldName: 'Name' },
//     { label: 'ProductCode', fieldName: 'ProductCode' } 
// ];

// export default class Productshowdata extends NavigationMixin(LightningElement) {
//     @track searchkey;
//     @track dataList = [];
//     @track columns = columns;
//     @track selectedRows = [];
//     @track error;
//     @track showDataTable = false;

//     handleSearchChange(event){
//         debugger;
//         this.searchkey = event.target.value;
//         this.handleProducts();
//         this.connectedCallback();

//     }

//     connectedCallback() {
//     debugger;
//     getProductDefault()
//     .then(result =>{
//        if(result){
//            this.dataList = result;
//        }
//     })
//     .catch(error =>{
//         this.error = error;
//     })
// }

//     handleProducts(){
//         debugger;
//         getProduct({ pname: this.searchkey })
//             .then((result) => {
//                 this.dataList = result;
//             })
//             .catch((err) => {
//                 console.error('Error fetching products:', err);
//             });
//     }

//     handleRowSelection(event){
//         debugger;
//         this.selectedRows = event.detail.selectedRows;
//     }

//     navigateToSelectedRecords(){
//         debugger;
//         this.showDataTable = true;
//         if(this.selectedRows.length > 0){
//             const selectedIds = this.selectedRows.map(row => row.Id).join(',');
//             this[NavigationMixin.Navigate]({
//                 type: 'standard__component',
//                 attributes: {
//                     componentName: 'c__DisplaySelectdRecord' // Child component name
//                 },
//                 state: {
//                     c__selectedIds: selectedIds // Passing selectedIds to child component
//                 }
//             });
//         }
//     }
// }