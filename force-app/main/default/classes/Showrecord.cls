public class Showrecord {
    @AuraEnabled(cacheable=true)
    public static list<Employee__c> ShoeMehod(){
        return[select id,Name__c,Phone__c from Employee__c];
    }
}