public class searchrecord {
     
    @AuraEnabled (cacheable=true)
    public static List<Account> retrieveAccounts(){
        return [SELECT Id, Name, Type, BillingCountry, Industry
                FROM Account
                LIMIT 25];
    }

}