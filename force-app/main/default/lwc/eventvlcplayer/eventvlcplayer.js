import { LightningElement } from 'lwc';
export default class Eventvlcplayer extends LightningElement {
    vol=0;
    con='please click the button to activate';

    handelvolIncrease(event){
        this.con =event.detail; //read the data/
        if(this.vol<101){
             this.vol=this.vol+1;
        }
       
    }
    handelvolDecrease(event){
        this.con =event.detail;  //read the data/
        if(this.vol>0)
        {
            this.vol=this.vol-1;
        }

    }
}