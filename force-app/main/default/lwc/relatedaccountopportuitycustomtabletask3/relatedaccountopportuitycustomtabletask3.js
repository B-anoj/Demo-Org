import { LightningElement,track   } from 'lwc';
import getAccount from '@salesforce/apex/Accountclass.getAccount';
export default class Relatedaccountopportuitycustomtabletask3 extends LightningElement {
    @track accountlist =[];
    @track AccountData =[];
    @track error;
    @track allaccs = false;
     @track selectedAccountId;

    connectedCallback() {
        debugger;
        getAccount().then((result) => {
            this.accountlist = result;
            let index = 0;
            let templist = [];
            for(var i=0;i<result.length;i++){
                let tempObj = {
                    Id : result[i].Id,
                    Name : result[i].Name,
                    Phone : result[i].Phone,
                    Description : result[i].Description,
                    sno : index,
                    selected : false
                };
                templist.push(tempObj);
            }
            this.accountlist = AccountData;
            this.accountlist = true;

        }).catch((err) => {
            this.error = err;
            console.log('error retrieving opportunity  :'+this.error);
        });
    }

    handelcheckbox(event) {
        debugger;
        const currentIndex = event.target.dataset.index;
        this.selectedAccountId = null;

        for(var i=0;i < this.accountlist.length;i++){
            if( i == currentIndex){
                this.accountlist[i].selected = true;
                this.selectedAccountId = this.accountlist[i].Id;
            }
            else{
                 this.accountlist[i].selected = false;
            }
        }
    }

}