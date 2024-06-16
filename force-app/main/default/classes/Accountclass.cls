public class Accountclass {
    @AuraEnabled
    public static list<Account> getAccount(){
        List<Account> allacc =[select Id,Name,Phone,Description From Account limit 5];
        return allacc;
    }

    @AuraEnabled
    public static List<Opportunity> gatallopportunity(Id accountId){
        List<Opportunity> listofOpportunity = [Select Id,Name,StageName,Description from Opportunity where AccountId =: accountId];
        return listofOpportunity;
    }

}