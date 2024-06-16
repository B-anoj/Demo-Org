public class countsalaryonemplyoee {
    public static void countsalarymeth(){
        list<Account> lsacc=[SELECT Id, Phone, Total_salary__c,(SELECT Id, Salary__c FROM Employees__r) 
                             FROM Account WHERE CreatedDate = THIS_MONTH];
        
        decimal countsal=0;
        if(!lsacc.isEmpty()){
            for(Account acc:lsacc){
                for(Employee__c emp :acc.Employees__r){
                    countsal = countsal + emp.Salary__c;
                }
                acc.Total_salary__c= countsal;
            }
            update lsacc;
            
        }
    }

}