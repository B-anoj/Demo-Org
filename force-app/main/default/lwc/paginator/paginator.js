import { LightningElement,api } from 'lwc';
export default class Paginator extends LightningElement {
    currentPage =1;
    totalRecords;
    RecordSize = 5;
    totalPage = 0 ;

    get records(){
        return this.visibleRecords;
    }
    @api 
    set records(data){
    if(data){
        this.totalRecords = data;
        //this.visibleRecords = data.slice(0,this.RecordSize);
        this.totalPage = Math.ceil(data.length/this.RecordSize);
        this.updateRecords();
    }
 }

    get disablePrevious(){
        return this.currentPage <= 1;
    } 

    get disableNext(){
        return this.currentPage >= this.totalPage;
    }
    previousHandler() { 
        debugger;
        if(this.currentPage>1){
            this.currentPage = this.currentPage - 1;
           this.updateRecords();
        }
    }

    nextHandler() {
        debugger;
       if(this.currentPage < this.totalPage){
           this.currentPage = this.currentPage + 1;
           this.updateRecords();
       }
    }

    updateRecords(){
        debugger;
        const start = (this.currentPage-1)*this.RecordSize;
        const end = this.RecordSize*this.currentPage;
        this.visibleRecords = this.totalRecords.slice(start,end);
         this.dispatchEvent(new CustomEvent('update',{
             detail:{
                 records:this.visibleRecords
             }
         }));

    }
}