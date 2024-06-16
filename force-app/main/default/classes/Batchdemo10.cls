//When opportunity is not closed won before 2  weeks then send email notification to user 
//& update opportunity stats to closed lost.
global class Batchdemo10 implements Database.Batchable<sObject>, Database.AllowsCallouts {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        Date twoWeeksAgo = Date.today().addDays(-14);
        return Database.getQueryLocator([
            SELECT Id, Name, OwnerId, Owner.Email, StageName
            FROM Opportunity
            WHERE StageName != 'Closed Won' AND CloseDate < : twoWeeksAgo
        ]);
    }
    
    global void execute(Database.BatchableContext bc, List<Opportunity> OpportunityList) {
        List<Opportunity> updateOpportunityList = new List<Opportunity>();
        for (Opportunity opp : OpportunityList) {
            // Update Opportunity status to 'Closed Lost'
            opp.StageName = 'Closed Lost';
            updateOpportunityList.add(opp);
            
            // Send email notification to Opportunity owner
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(new String[]{ opp.Owner.Email });
            mail.setSubject('Opportunity Status Update');
            mail.setPlainTextBody('Hello ' + opp.Owner.Name + ',\n\nThe Opportunity "' 
                                  + opp.Name + '" was not closed won before two weeks and has been updated to Closed Lost.\n\nBest Regards,\nYour Organization');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[]{ mail });
        }
        update updateOpportunityList;
    }
    
    global void finish(Database.BatchableContext bc) {
        System.debug('success');
    }
}