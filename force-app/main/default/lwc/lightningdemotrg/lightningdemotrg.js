import { LightningElement,track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';
import datatatbl from '@salesforce/apex/lightnindatatblgtrgdemo.datatatbl';
import deleteInteractionRecord from '@salesforce/apex/lightnindatatblgtrgdemo.deleteRecord';

const actions= [
    {label :'Edit', name:'Edit'},
    {label :'Delete', name: 'Delete'},
    {label : 'View', name : 'View'},
];

const columns=[
    {label: 'Name', fieldName: 'Name'},
    {label: 'Phone', fieldName: 'Phone'},
    {
        type:'action',
        typeAttributes:{rowActions: actions},
    },
];

export default class Lightningdemotrg extends LightningElement {
    dataList=[];
    record={};
    columns=columns;

    @track isDialogVisible=false;

    @track originalMessage;

    connectedCallback() {
        datatatbl()
        .then(result =>{
            this.dataList=result;
        });
    }


        handleRowAction(event){
            const actionName=event.detail.action.name;
            const rowId=event.detail.row.Id;

            switch(actionName){
                case 'Delete' :
                this.DeleteRecord(rowId);
                break;
                case 'Edit' :
                this.EditRecord(rowId);
                break;
                case 'View' :
                this.viewRecord(rowId);
                break;
                default :
            }
        }  

        DeleteRecord(rowId){
            this.isDialogVisible=true;
            this.originalMessage = rowId;
           // this.originalMessage='test class';
           // console.log(rowId);
        }
        handelDialogClick(event){
            //console.log('event' +event.detail.status);
           // this.originalMessage= false;
            //alert('i am in handeldialoglogclick' +event.detail.status);
            if(event.detail.status == 'confirm'){
            let rowId = event.detail.originalMessage;
            // call apex class to delete the record and pass the record id
            deleteInteractionRecord({studentId : event.detail.originalMessage})
            .then(result => {
                if(result){
                    const event = new ShowToastEvent({
                        title: 'Status',
                        message: 'The record is Deleted successfully',
                        variant: 'success',
                        mode: 'dismissable'
                    });
                    this.dispatchEvent(event);
                    window.location.reload();
                }else{
                    const event = new ShowToastEvent({
                        title: 'Status',
                        message: 'The record is failed to Delete',
                        variant: 'error',
                        mode: 'dismissable'
                    });
                    this.dispatchEvent(event);
                    window.location.reload();
                }
            })
        }else{
            this.isDailogVisible = false;
        }
        this.isDailogVisible = false;
    }
        


        viewRecord(rowId){
        this[NavigationMixin.Navigate]({
            type : 'standard__recordPage',
            attributes : {
                recordId : rowId,
                objectApiName : 'Account',
                actionName : 'view',
            },
        });
    }

        EditRecord(rowId){
            this[NavigationMixin.Navigate]({
            type : 'standard__recordPage',
            attributes : {
                recordId : rowId,
                objectApiName : 'Account',
                actionName : 'edit',
            },
        });
            console.log(rowId);
        }


}