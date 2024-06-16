public class BreachedWebsitesController {
    @AuraEnabled(cacheable=true)
    public static List<Website__c> getBreachedWebsites() {
        return [SELECT Id, Name,Location__c,Date__c FROM Website__c];
    }

}