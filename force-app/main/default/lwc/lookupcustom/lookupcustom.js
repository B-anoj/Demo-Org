import { LightningElement,api } from 'lwc';
export default class Lookupcustom extends LightningElement {
    @api label='';
    @api iconName='';
    @api placeHolder='';
    @api sObjectApiName='';
    @api defaultRecordId='';
    @api issearchLoading=false;//to control load spinner
    searchKey='';//to store input field value
    lsrResult=[];//to stoere list of returned record
    hasRecord=true;
    dealyTimeout;
    selectedRecord={};


    toggleResult(){

    }
    handleKeyChange(){

    }

}