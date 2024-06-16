import { LightningElement,wire ,track} from 'lwc';
import getcon from '@salesforce/apex/Contackhelper.getcon';
export default class Contactactdatabywirefunction extends LightningElement {
    @track result;
    @track name;
    @wire(getcon,{sname:'$name'}) getcontactlist({error,data}){
      if(data){
          this.result=data;
      }
      else if(error){
          this.error=error;
      }
  }
  handlechange(event){
      this.name=event.target.value;
  }


}