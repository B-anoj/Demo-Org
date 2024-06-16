public class oppreq {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity_Request__c> getOpportunities() {
        return [SELECT Id, Name,City__c,School_Name__c,Subject__c,Classroom_ID__c FROM Opportunity_Request__c WHERE Status__c = 'Open'];
    }

    @AuraEnabled
    public static String updateVolunteerDetails(String oppId, String volunteerName, String volunteerEmail) {
        try{
            Opportunity_Request__c updatedOpp = new Opportunity_Request__c(Volunteer_Name__c = volunteerName, Volunteer_Email__c = volunteerEmail, Id = oppId, Status__c = 'Closed');
            update updatedOpp;
        }
        catch(exception ex){
            System.debug('error' + ex);
        }
    return 'Success';    
    }
}