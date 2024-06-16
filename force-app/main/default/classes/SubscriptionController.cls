public class SubscriptionController {
    @AuraEnabled
    public static Id getFirstSubscriptionId(string recId) {
        // Fetching the first Subscription record ID (Subscription_ID__c) without any specific criteria
       List<Subscription__c> subs = [SELECT Id FROM Subscription__c where Id = :recId];
        return subs[0].Id;
    }
}