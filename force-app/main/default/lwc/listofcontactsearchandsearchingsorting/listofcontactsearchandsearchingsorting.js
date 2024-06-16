import { LightningElement,track,wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts';
const  columns = [
        { label: 'First Name', fieldName: 'FirstName' , sortable: "true"},
        { label: 'Last Name', fieldName: 'LastName' },
        { label: 'Email', fieldName: 'Email' },
        { label: 'Phone', fieldName: 'Phone' }
    ];

export default class Listofcontactsearchandsearchingsorting extends LightningElement {
   
   @track searchTerm = '';
   columns = columns;
   @track filteredData;
   data = [];
   @track sortBy;
   //defaultSortDirection = 'asc';
   @track sortDirection = 'asc';
  


    @wire(getContacts,{Fsname: '$searchTerm'})
    wiredContacts({ error, data }) {
        debugger;
        if (data) {
            this.data = data;
            //this.filterContacts();
        } else if (error) {
            console.error('Error fetching contacts', error);
        }
    }

    handleSearch(event) {
        debugger;
        this.searchTerm = event.target.value.toLowerCase();
    }

    doSorting(event) {
        debugger;
        this.sortBy = event.detail.fieldName;
        this.sortDirection = event.detail.sortDirection;
        this.sortData(this.sortBy, this.sortDirection);
    }

     sortData(fieldname, direction) {
        debugger;
        let parseData = JSON.parse(JSON.stringify(this.data));
        // Return the value stored in the field
        let keyValue = (a) => {
            return a[fieldname];
        };
        // cheking reverse direction
        let isReverse = direction === 'asc' ? 1: -1;
        // sorting data
        parseData.sort((x, y) => {
            x = keyValue(x) ? keyValue(x) : ''; // handling null values
            y = keyValue(y) ? keyValue(y) : '';
            // sorting values based on direction
            return isReverse * ((x > y) - (y > x));
        });
        this.data = parseData;
    }

    //  handleSortAccountData(event) {
    //     debugger;
    //     this.sortBy = event.detail.fieldName;
    //     this.sortDirection = event.detail.sortDirection;
    //     this.sortAccountData(this.sortBy,this.sortDirection); 
    // }
    //  sortAccountData(fieldname, direction) {
    //     debugger;    
    //     var parseData = JSON.parse(JSON.stringify(this.data));
    //     debugger;
    //         let keyValue = (a) => {
    //         return a[fieldname];
    //     };
    //     let isReverse = direction === 'asc' ? 1: -1;
    //        parseData.sort((x, y) => {
    //         x = keyValue(x) ? keyValue(x) : ''; 
    //         y = keyValue(y) ? keyValue(y) : '';
           
    //         return isReverse * ((x > y) - (y > x));
    //     });
        
    //     this.data = parseData;
    //  }
}