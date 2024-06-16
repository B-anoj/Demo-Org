public class webclass {
       @AuraEnabled(cacheable=true)
    public static List<Website__c> getBreachedWebsite() {
        return [SELECT Id, Name, Location__c, Date__c FROM Website__c ORDER BY Date__c DESC];
    }
}