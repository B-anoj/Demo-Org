public class Accounthandler {

    @AuraEnabled(cacheable=true)
    public static list<Account> getaccount(){
        return [select id,name,phone from Account limit 10];
    }

}