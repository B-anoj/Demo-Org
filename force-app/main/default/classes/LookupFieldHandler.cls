public class LookupFieldHandler {
     @AuraEnabled
    public static List<Account> getAccount(String recordId){
        List<Account> accList = [SELECT Id, Name, Phone FROM Account WHERE Id = :recordId];
        return accList;
    }

     @AuraEnabled
    public static List<Contact> getContactsForAccount(String accountId) {
        return [SELECT Id, Name, Email FROM Contact WHERE AccountId = :accountId];
    }
}