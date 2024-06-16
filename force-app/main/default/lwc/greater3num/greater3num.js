import { LightningElement } from 'lwc';

export default class Greater3num extends LightningElement {
    num1;
    num2;
    num3;
   

    firstnum(event){
        this.num1=event.target.value;
    }
    secondnumber(event){
        this.num2=event.target.value;
    }
    thirdnumber(event){
        this.num3=event.target.value;
    }
    calculateme(event){
        const a =parseInt(this.num1);
        const b =parseInt(this.num2);
        const c =parseInt(this.num3);
        if(a>b && a>c){
            alert('the greate number is'+a);
        }
        else if(b>c && b>a){
            alert('the greater number is'+b)
        }
        else{
            alert('the greater number is'+c);
        }
    }
    clearme(event){
        this.num1='';
        this.num2='';
        this.num3='';

    }
}