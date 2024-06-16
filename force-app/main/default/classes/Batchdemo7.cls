//create Batch class whenever a user closed won opportunity send Email Notification to user After 2 days.
public class Batchdemo7 implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc){
        Date TwoDaysBefore = Date.Today().AddDays(-2);
        return DataBase.getQueryLocator([SELECT Id, Name, ownerId, owner.Email,StageName 
                                         from Opportunity Where StageName = 'Closed won' AND CloseDate = : TwoDaysBefore
                                        ]);
    }
    public void execute(Database.BatchableContext bc,List<Opportunity> OpportunityList){
         System.debug('OpportunityList Size === >'+OpportunityList.size());
    }
    public void finish(Database.BatchableContext bc){
        
        AsyncApexJob a = [Select Id, Status,ExtendedStatus,NumberOfErrors, JobItemsProcessed,TotalJobItems, 
                          CreatedBy.Email from AsyncApexJob where Id =:BC.getJobId()];
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {a.CreatedBy.Email};
        mail.setToAddresses(toAddresses);
        mail.setSubject('When Opportunity stage is closedwon and date is before two days' + a.Status);
        mail.setPlainTextBody('records processed ' + a.TotalJobItems +   'with '+ a.NumberOfErrors + ' failures.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    } 
    
    public void execute(Database.BatchableContext bc){
        System.debug('Success');
       // Batchdemo7 inst = new Batchdemo7();
        //ID batchprocessid = Database.executeBatch(inst);
    }
    
}