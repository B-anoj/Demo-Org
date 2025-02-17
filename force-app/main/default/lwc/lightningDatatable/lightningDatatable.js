import { LightningElement} from 'lwc';
export default class LightningDatatable extends LightningElement {
    employeeColumns = [
        { label: 'Employee Id', fieldName: 'employeeId' },
        { label: 'First Name', fieldName: 'firstName' },
        { label: 'Last Name', fieldName: 'lastName' },
        { label: 'Phone Number', fieldName: 'employeePhone', type: 'phone' },
        { label: 'Email Address', fieldName: 'employeEemail', type: 'email' }
    ];
     employeeData = [
        {
            employeeId: '1',
            firstName: 'Richard',
            lastName: 'Hendricks',
            employeePhone: '(158) 389-2794',
            employeeEmail: 'richard@piedpiper.com'
        },
        {
            employeeId: '2',
            firstName: 'Jared',
            lastName: 'Dunn',
            employeePhone: '(518) 390-2749',
            employeeEmail: 'jared@piedpiper.com'
        },
        {
            employeeId: '3',
            firstName: 'Erlich',
            lastName: 'Bachman',
            employeePhone: '(815) 391-2974',
            employeeEmail: 'erlich.bachman@piedpiper.com'
        },
        {
            employeeId:'4',
            firstName:'Banoj',
            lastName:'Samal',
            employeePhone:'778905665',
            employeeEmail:'samalbanoj234@gmail.com'
        }
    ];

}