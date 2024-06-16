import { LightningElement ,track,wire} from 'lwc';
import  getaccounts from '@salesforce/apex/WireBindingwithcomplexparameter.getaccounts';
export default class WireBindingwithcomplexparameter extends LightningElement {
    result;
    @track input;
    @track sname;
    @wire (getaccounts,{name:'$sname'}) accounts({error,data})
    {
        if(data)
        {
            this.result=data;
        }
        else if(error)
        {
            this.result=data;
        }

    };
    handleChange(event){
        this.input=event.target.value;
    }
    handleClick(event){
        this.sname=this.input;
    }


}