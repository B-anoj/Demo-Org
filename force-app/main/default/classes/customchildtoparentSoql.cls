//Custom child to parent relationship
public class customchildtoparentSoql {
    public static void customchildmeth(){
        list<Employee__c>lsemp=[select id,Name__c,phone__c,Account__r.phone from Employee__c];
        
        if(!lsemp.isEmpty())
            for(Employee__c emp:lsemp){
                emp.Phone__C=emp.Account__r.phone;
            }
        update lsemp;
    }
}