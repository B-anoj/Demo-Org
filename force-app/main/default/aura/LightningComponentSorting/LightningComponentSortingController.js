({
    doInit : function(component, event, helper) {
        component.set('v.columns', [
            {label: 'Name', fieldName:'Name', sortable:true, type:'text'},
            {label: 'Phone', fieldName:'Phone', sortable:true, type:'phone'},
            {label: 'Type', fieldName:'Type', sortable:true, type:'text'},
            {label: 'Created Date', fieldName: 'CreatedDate',type: 'date', sortable:true, 
             typeAttributes:{day:'numeric',month:'short',year:'numeric',hour:'2-digit',minute:'2-digit',second:'2-digit',hour12:true}}
        ]);
        helper.fetchAccounts(component, helper);
    },
     
    updateSorting: function (cmp, event, helper) {
        var fieldName = event.getParam('fieldName');
        var sortDirection = event.getParam('sortDirection');
        cmp.set("v.sortedBy", fieldName);
        cmp.set("v.sortedDirection", sortDirection);
        helper.sortData(cmp, fieldName, sortDirection);
    },
     
    handleNext: function(component, event, helper){  
        debugger;
        component.set("v.currentPageNumber", component.get("v.currentPageNumber") + 1);
        helper.setPaginateData(component);
    },
     
    handlePrevious: function(component, event, helper){
        debugger;
       component.set("v.currentPageNumber", component.get("v.currentPageNumber") - 1);
       helper.setPaginateData(component);
    },
     
    onFirst: function(component, event, helper) { 
        debugger;
        component.set("v.currentPageNumber", 1);
        helper.setPaginateData(component);
    },
     
    onLast: function(component, event, helper) {    
        debugger;
        component.set("v.currentPageNumber", component.get("v.totalPages"));
        helper.setPaginateData(component);
    },
})