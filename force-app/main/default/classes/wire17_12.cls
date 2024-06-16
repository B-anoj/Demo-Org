public class wire17_12 {
    @AuraEnabled(cacheable=true)

    public static list<Account> getacc(){
    return [select Id,Name,Phone from Account limit 5];
    }

}