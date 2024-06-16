import { LightningElement,track,wire } from 'lwc';
import findcontacts from '@salesforce/apex/WireFunctionOrProperty.findcontacts';
export default class WirefuctionORProperty extends LightningElement {
    @track searchkey;
    @track banojData;
    @track banojError;
   
 handelchange(event){
        this.searchkey=event.target.value; 
    }
    //***Wire a property//
   @wire (findcontacts,{searchtext:'$searchkey'})contact;

     //*** wire a function***//
      @wire (findcontacts,{searchtext:'$searchkey'})contactf({error,data}){
          if(data)
          {
              this.banojData=data
          }
          else 
          {
              this.banojError=error;
              this.banojData=undefined;
          }
      };


}