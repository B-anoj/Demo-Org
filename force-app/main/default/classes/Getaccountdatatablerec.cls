public class Getaccountdatatablerec {
    @AuraEnabled(cacheable=true)
    public static list<Account> getmethod(){
        return [select Id,Name,Phone,Description from Account limit 5];
    }

}