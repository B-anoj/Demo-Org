trigger OpportunityRequestTrigger on Opportunity_Request__c (after update) {
    if (Trigger.isAfter && Trigger.isUpdate) {
        OpportunityRequestTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
    }
}