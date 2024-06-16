public class Wireusingfunction {
    @AuraEnabled(cacheable=true)
     public static list<Account> getacclist(){
    return [select Id,Name,Phone from Account limit 5];
    }
}