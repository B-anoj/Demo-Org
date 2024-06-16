public class relatedRelatedtask3handler {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [SELECT Id, Name,Phone FROM Account limit 5];
    }

    @AuraEnabled
    public static List<Opportunity> getOpportunity(Id accountId) {
        return [SELECT Id, Name, Amount FROM Opportunity WHERE accountId = :accountId];
    }
}