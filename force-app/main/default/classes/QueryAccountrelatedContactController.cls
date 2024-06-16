public class QueryAccountrelatedContactController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getaccountrelatedcont(){
        return [select Id,Name,Phone,(Select Id,Name from Contacts) from Account limit 5];
    }
}