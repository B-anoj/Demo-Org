import { LightningElement,track } from 'lwc';

export default class Loopandarraye2 extends LightningElement {
    evennum=[2,8,10,12,14,4,6,18,16];
    student ={'Name':'Banoj','Age':23,'city':'Odisha','Salary':2500}

    @track students =[
        {'Name':'Manoj','Age':24,'city':'Odisha','Salary':2500},
        {'Name':'Soumya','Age':26,'city':'Odisha','Salary':2500},
        {'Name':'subrat','Age':33,'city':'Odisha','Salary':2500}
];
}