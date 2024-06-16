import { LightningElement,track } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';

export default class Lwccreate extends LightningElement {
    @track name;
    @track phone;
    @track fax;
    @track industry
     
    callname(event){
        this.name=event.target.value
    }
    callphone(event){
        this.phone=event.target.value
    }
    callfax(event){
        this.fax=event.target.value
    }
    callind(event){
        this.industry=event.target.value
    }
    callme(event){
        //step 1---->Create field list

        const fields={'Name':this.name, 'Phone':this.phone, 'Fax':this.fax, 'Industry':this.industry};

        //step 2----->Create API Record with fields

        const recordData={apiName:'Account',fields}

        //step 3---->call imperation

        createRecord(recordData).then().catch();
    }

}