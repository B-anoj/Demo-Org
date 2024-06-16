import { LightningElement ,api} from 'lwc';
export default class Child1 extends LightningElement {
    @api itemname='welcome to child component';

    @api hadelchange(){
        this.itemname='after click it is convert to parent component';
    }

}