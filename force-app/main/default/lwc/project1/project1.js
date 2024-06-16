import { LightningElement } from 'lwc';
export default class Project1 extends LightningElement {
    handleClick(){

    }
    
    Visible=true;


//This is for looping statement------------->

    Employee=[
        {
        Id:101,
        FirstName:'Banoj',
        LastName:'Samal',
        Salary:'12000'
        },
        {
            Id:102,
            FirstName:'Rohit',
            LastName:'Sharma',
            Salary:100000000
        },
    ];

//this is for binding the data to the html page---------->

     FirstName;
     handelchange(event){
         this.FirstName=event.target.value;
     }

}