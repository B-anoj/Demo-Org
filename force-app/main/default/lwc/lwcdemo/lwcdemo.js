import { LightningElement} from 'lwc';
import templateprimary from './firsthtml.html';
import templatesecondary from './secondhtml.html';
export default class Lwcdemo extends LightningElement {
  
    constructor(){
        super()
        console.log('i am calling the constructor');
    }
     connectedCallback() {
           let varelement=this.template;
           console.log('connected callback is=>'+varelement.isconnected);
    }
    render(){
        console.log('render call is',this.showtemplatesecondary);
        return this.showtemplatesecondary ?  templatesecondary : templateprimary;
    }
}