import { LightningElement,track} from 'lwc';
export default class DatabindingTroop extends LightningElement {

    @track message;

    handelChange(event){
        debugger;
      this.message = event.target.value;    
      console.log('the msg is====>' +this.message);
    }

}