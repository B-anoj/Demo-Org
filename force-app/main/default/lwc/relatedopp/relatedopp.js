import { LightningElement,track } from 'lwc';
import getAccount from '@salesforce/apex/Accountclass.getAccount';
import gatallopportunity from '@salesforce/apex/Accountclass.gatallopportunity';
export default class Relatedopp extends LightningElement {
    @track accounts = [];
    @track newaccountList = [];
    @track selectedAccountId;
    @track ListofOpps = [];
    @track ListofOpportunity = false;
    @track allaccs = false;

    connectedCallback(){
        debugger;
        setTimeout(() =>{
            getAccount().then((result) => {
                this.accounts = result;
                let index = 0;
                let tempList = [];
                 for(var i=0;i<result.length;i++){
                     index +=1;
                     let temoObj = {
                         Id : result[i].Id,
                         Name : result[i].Name,
                         Phone : result[i].Phone,
                         Description : result[i].Description,
                         sno : index,
                         selected:false
                     };
                     tempList.push(temoObj);
                 }
                 this.newaccountList = tempList;
                 this.allaccs = true;
                 this.ListofOpportunity = false;
            }).catch((err) => {
                console.error('Error retrieving contacts:', err);
            });
        },100);
    }

     handleCheckboxChange(event) {
         debugger;
        const currentIndex = event.target.dataset.index;
        this.selectedAccountId = null;

        for(var i=0;i < this.newaccountList.length;i++){
            if( i == currentIndex){
                this.newaccountList[i].selected = true;
                this.selectedAccountId = this.newaccountList[i].Id;
            }
            else{
                 this.newaccountList[i].selected = false;
            }
        }
    }

    handleNext() {
        debugger;
         if (this.selectedAccountId) {
            // Implement the logic to navigate to the next step or screen
            console.log('Selected AccountId:', this.selectedAccountId);
            gatallopportunity({accountId: this.selectedAccountId}).then((result) => {
                this.ListofOpps = result;
                this.allaccs = false;
                this.ListofOpportunity = true;
            }).catch((err) => {
                 console.error('Error retrieving opportunitues:', err);
            });
        } else {
            console.warn('No account selected.');
        }
    }
    handleBack(){
        this.ListofOpportunity = false;
        this.allaccs = true;       
    }

}