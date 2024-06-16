import { LightningElement,track } from 'lwc';

export default class Lwcmon extends LightningElement {
     @track accountList=[];

    handleAddRow(){
        let newAccount={Name:' ',Phone:' ',Rating:' '};
        this.accountList.push(newAccount);

    }
    
    handleDeleteRow(event) {
        let rowId = event.target.dataset.row;
        let indexToDelete = this.accountList.findIndex(account => account.Id === rowId);
        if (indexToDelete !== -1) {
            let accountToDelete = this.accountList[indexToDelete];
            if (accountToDelete.Id) {
                this.deleteAccount(accountToDelete.Id);
            }
            this.accountList.splice(indexToDelete, 1);
            this.accountList = [this.accountList];
        }
    }
      async deleteAccount(recordId) {
        try {
            await deleteRecord(recordId);
        } catch (error) {
            console.log('Error deleting account: ', error);
        }
    }

}