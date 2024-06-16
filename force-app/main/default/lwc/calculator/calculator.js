import { LightningElement } from 'lwc';
export default class Calculator extends LightningElement {
    res;
    num1;
    num2;

    handlerchange1(event){
        this.num1=event.target.value;
    }
    handlerchange2(event){
        this.num2=event.target.value;
    }
DoAdd(){
        this.res= parseInt(this.num1)+parseInt(this.num2);

    }
Dosub(){
     this.res= this.num1-this.num2;

}

Domul(){
    this.res= this.num1*this.num2;
}
Dodiv(){
    this.res= this.num1/this.num2;
}
    
}