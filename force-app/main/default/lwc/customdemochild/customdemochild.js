import { LightningElement } from 'lwc';
export default class Customdemochild extends LightningElement {
    name='';
    handelchange(event){
        this.name=event.target.value;
    

    const pevent=new CustomEvent('passdata',{detail:this.name});
    this.dispatchEvent(pevent);
    }


}