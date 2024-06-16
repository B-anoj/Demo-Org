import { LightningElement,api,track } from 'lwc';
export default class Samplechild extends LightningElement {

    @track stuName;
    parentComponentCarName;

    @api messageToDisplay(parentCarName){
        this.parentComponentCarName = parentCarName;
    }

    getstudentName(event){
        this.stuName=event.target.value;
    }
    //we dispatch a custom evenet

    passNametoParent(){
        const event=new CustomEvent('messagefromchild',{
            detail : this.stuName
        });
        this.dispatchEvent(event);
    }
}