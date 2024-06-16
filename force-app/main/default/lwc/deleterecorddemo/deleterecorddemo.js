import { LightningElement } from 'lwc';
import deleterec from '@salesforce/apex/deleterecordcls.deleteRecord'
export default class Deleterecorddemo extends LightningElement {
recordId='0015g00001Bt6iKAAR' ;
result;
error;

 handleDeleteRecord(){
     deleterec({recordId:this.recordId})

     .then(result=>{
         console.log('record is deleted sucessfully',result);
     })

     .catch(error=>{
         console.log('record are not deleted sucessfully',error);
     });
 }

}