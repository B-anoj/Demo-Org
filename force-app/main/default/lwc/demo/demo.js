import { LightningElement } from 'lwc';
export default class Demo extends LightningElement {
 name=true;

Address=[
    {
        Id:1,
        Add:'od',
},
{
    Id:2,
    Add:'bbsr',

}
]

name1;
chnghandeler(event){
this.name1=event.target.value;
}
}