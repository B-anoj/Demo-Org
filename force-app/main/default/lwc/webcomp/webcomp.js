import { LightningElement,wire } from 'lwc';

import getBreachedWebsite from '@salesforce/apex/webclass.getBreachedWebsite';

const columns = [
    { label: 'Website', fieldName: 'Name', sortable: true },
    { label: 'Date', fieldName: 'Date__c', sortable: true },
    { label: 'Location', fieldName: 'Location__c', sortable: true }
];

export default class Webcomp extends LightningElement {

    searchTerm = '';
    sortedBy = 'Date__c';
    sortedDirection = 'asc';
    filteredWebsites = [];

    columns = columns;

    sortOptions = [
        { label: 'Date (Ascending)', value: 'Date__c asc' },
        { label: 'Date (Descending)', value: 'Date__c desc' },
        { label: 'Website Name (Ascending)', value: 'Name asc' },
        { label: 'Website Name (Descending)', value: 'Name desc' }
    ];


    @wire(getBreachedWebsite)
    wiredBreachedWebsite({ error, data }) {
        if (data) {
            this.filteredWebsites = data;
        } else if (error) {
            // Handle error
        }
    }
    

       handleSearch(event) {
        this.searchTerm = event.target.value.toLowerCase();
        this.filterWebsites();
    }

      handleSort(event) {
        this.sortedBy = event.detail.fieldName;
        this.sortedDirection = event.detail.sortDirection;
        this.filterWebsites();
    }

    filterWebsites() {
        const filteredData = this.filteredWebsites.filter((website) =>
            Object.values(website)
                .join('')
                .toLowerCase()
                .includes(this.searchTerm)
        );
        this.filteredWebsites = filteredData;
    }

}