public class lwcscenario {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [SELECT Id, Name, Industry, Phone, Rating FROM Account limit 2];
    }
     @AuraEnabled
    public static void createAccount(String accName, String accIndustry, String accPhone, String accRating) {
        Account newAcc = new Account(
            Name = accName,
            Industry = accIndustry,
            Phone = accPhone,       
            Rating = accRating
        );
        insert newAcc;
    }

    @AuraEnabled
    public static void deleteAccount(String accId) {
        Account accToDelete = new Account(Id = accId);
        delete accToDelete;
    }
    
}