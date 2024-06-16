import { LightningElement,wire,track } from 'lwc';

import getBreachedWebsites from '@salesforce/apex/BreachedWebsitesController.getBreachedWebsites';

const columns = [
    { label: 'Website Name', fieldName: 'Name', type: 'text' },
    { label: 'Location', fieldName: 'Location__c', type: 'text' },
    { label: 'Date', fieldName: 'Date__c', type: 'date' }
];

export default class BreachedWebsitesTab extends LightningElement {
    @track breachedWebsites = [];
    originalBreachedWebsites = [];

    defaultSortDirection = 'asc';
    sortedBy = 'Date__c';
    searchTerm = '';
    columns=columns;

    @wire(getBreachedWebsites)
    wiredBreachedWebsites({ error, data }) {
        if (data) {
            this.breachedWebsites = data;
             this.originalBreachedWebsites = data; // Update the original array as well
            this.sortData(this.sortedBy, this.defaultSortDirection);
        } else if (error) {
            console.error(error);
        }
    }


     get sortOptions() {
        return [
            { label: 'Date (Ascending)', value: 'Date__c asc' },
            { label: 'Date (Descending)', value: 'Date__c desc' },
            { label: 'Website Name (Ascending)', value: 'Name asc' },
            { label: 'Website Name (Descending)', value: 'Name desc' }
        ];
    }

      handleSearch(event) {
        this.searchTerm = event.target.value.toLowerCase();
        this.filterData();
        
    }

    handleSort(event) {
        const fieldName = event.detail.value.split(' ')[0];
        const sortDirection = event.detail.value.split(' ')[1];
        this.sortedBy = fieldName;
        this.defaultSortDirection = sortDirection;
        this.sortData(fieldName, sortDirection);
    }


    filterData() {
        if (this.searchTerm == '') {
            this.breachedWebsites = this.originalBreachedWebsites;
        } else {
            this.breachedWebsites = this.originalBreachedWebsites.filter(
                (website) =>
                    website.Name.toLowerCase().includes(this.searchTerm)
            );
        }
    }


      sortData(fieldName, sortDirection) {
        const reverse = sortDirection !== 'asc';
        const dataClone = JSON.parse(JSON.stringify(this.breachedWebsites));
        dataClone.sort((a, b) => {
            let valueA = a[fieldName] ? a[fieldName].toLowerCase() : '';
            let valueB = b[fieldName] ? b[fieldName].toLowerCase() : '';
            if (valueA < valueB) {
                //condition ? <expression if true> : <expression if fals
                return reverse ? 1 : -1;
            } else if (valueA > valueB) {
                return reverse ? -1 : 1;
            }
            return 0;
        });
        this.breachedWebsites = dataClone;
    }
}