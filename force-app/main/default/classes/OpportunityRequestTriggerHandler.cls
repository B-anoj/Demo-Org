public with sharing class OpportunityRequestTriggerHandler {
    public static void handleAfterUpdate(List<Opportunity_Request__c> newOpportunityRequests, Map<Id, Opportunity_Request__c> oldOpportunityRequestMap) {
        List<Opportunity_Request__c> recordsToUpdate = new List<Opportunity_Request__c>();
        List<Messaging.SingleEmailMessage> emailMessages = new List<Messaging.SingleEmailMessage>();

        for (Opportunity_Request__c newOppReq : newOpportunityRequests) {
            Opportunity_Request__c oldOppReq = oldOpportunityRequestMap.get(newOppReq.Id);

            // Check if Status__c field has been updated to 'Open'
            if (newOppReq.Status__c == 'Closed' && newOppReq.Status__c != oldOppReq.Status__c) {
                recordsToUpdate.add(newOppReq);

                // send emails to Email__c and Volunteer_Email__c
                if (!String.isBlank(newOppReq.Email__c)) {
                    Messaging.SingleEmailMessage email1 = new Messaging.SingleEmailMessage();
                    email1.setToAddresses(new List<String>{ newOppReq.Email__c });
                    email1.setSubject('Update Notification');
                    email1.setPlainTextBody('The status of your request has been updated.');
                    emailMessages.add(email1);
                }

                if (!String.isBlank(newOppReq.Volunteer_Email__c)) {
                    Messaging.SingleEmailMessage email2 = new Messaging.SingleEmailMessage();
                    email2.setToAddresses(new List<String>{ newOppReq.Volunteer_Email__c });
                    email2.setSubject('Update Notification');
                    email2.setPlainTextBody('The status of a volunteer request has been updated.');
                    emailMessages.add(email2);
                }
            }
        }

        // Send the emails
        if (!emailMessages.isEmpty()) {
            try{
                Messaging.sendEmail(emailMessages);
            }
            catch(exception ex){
                system.debug(ex);
            }
        }
    }
}