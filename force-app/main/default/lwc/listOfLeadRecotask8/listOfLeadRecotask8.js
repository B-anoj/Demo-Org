import { LightningElement,track } from 'lwc';
import getListRec from '@salesforce/apex/fetchleaddata.getListRec';
export default class ListOfLeadRecotask8 extends LightningElement {

 @track showleadrecords = [];
connectedCallback() {
    setTimeout(() =>{
        this.callapexmethod()
    },400);
}

callapexmethod(){
        getListRec()
        .then((result) => {
            console.log('lead record',result);
            this.showleadrecords = result;
            for(var i=0; i<this.showleadrecords.length; i++){
                if(this.showleadrecords[i].Status == 'Open - Not Contacted'){
                    this.showleadrecords[i].color = 'color:green;';
                } if(this.showleadrecords[i].Status == 'Working - Contacted'){
                    this.showleadrecords[i].color = 'color:blue;';
                } else if(this.showleadrecords[i].Status == 'Demo'){
                    this.showleadrecords[i].color = 'color:red;';
                }
            }
        })
        .catch((error) => {
            console.error('error',error);
        });
    }
}
//     leadRecords = [];
//     error;

//     connectedCallback() {
//         this.fetchleadRecord();
//     }

//     fetchleadRecord(){
//         debugger;
//         getListRec()
//         .then((result) => {
//              console.log('lead record=====>', result);
//             this.leadRecords = result;
//              console.log('lead record=====>', this.leadRecords);
//             //  for(var i=0;i<this.leadRecords;i++){
//             //      if(this.leadRecords[i].Status == 'Open - Not Contacted'){
//             //          this.leadRecords[i].color = 'color:green;'; 
//             //      }
//             //      if(this.leadRecords[i].Status == 'Working - Contacted'){
//             //          this.leadRecords[i].color = 'color:Red;'; 
//             //      }
//             //     else if(this.leadRecords[i].Status == 'New Status'){
//             //          this.leadRecords[i].color = 'color:Orange;'; 
//             //      }
//             //  }
            
//         }).catch((err) => {
//             this.error = err;
//              console.error('Error fetching lead records', this.error);
//         });
//     }