import { LightningElement,api } from 'lwc';
export default class Employeecomponent extends LightningElement {
    @api EmpName;

    connectedCallback() {
        console.log('connected call back is trigger');
        this.EmpName='Banoj';
    }

    renderedCallback(){
        console.log('render call back method is called');
    }

    disconnectedCallback() {
        console.log('disconnected callback method is trigger');
        this.EmpName='Rakesh';
    }

    errorCallback(error, stack) {
        console.log('error callback method is trigger');
        this.EmpName='sambit';
    }

    render(){
        console.log('render method is called');
    }

    getclick(event){
        this.EmpName=event.details.value;
    } 

    handleClick(){
        console.log('save the record');
    }
}