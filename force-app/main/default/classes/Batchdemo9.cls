//When Record is deleted send Email notificationto record owner after 1 week

 public class Batchdemo9 implements Database.Batchable<sObject>,Schedulable,Database.Stateful {
    public Database.QueryLocator start(Database.BatchableContext bc){
        Date SevenDaysAfter = Date.Today().addDays(+7);      
        return Database.getQueryLocator([SELECT Id,CreatedDate FROM Opportunity WHERE 
                                         CreatedDate < : SevenDaysAfter]);
    }
    public void execute(Database.BatchableContext bc, List<Opportunity> OpportunityList){
       // List<Opportunity> deleteopp = (list<Opportunity>)OpportunityList;
        delete OpportunityList;
        System.debug('Deleted opportunity'+OpportunityList);
    }
   
    public void finish(Database.BatchableContext bc){
        
        AsyncApexJob aa = [Select Id, Status, NumberOfErrors, JobItemsProcessed, MethodName, TotalJobItems, CreatedBy.Email from AsyncApexJob where Id =:BC.getJobId()];
        
        // Send an email to the Apex job's submitter notifying to user email.
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {aa.CreatedBy.Email};
        mail.setToAddresses(toAddresses);
        mail.setSubject('Opportunity Record is Deleted-Assig3: ' + aa.Status);
        String bodyText='A new Opportunity Record is Deleted';
        mail.setPlainTextBody(bodyText);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
       
    }
    
     //Method which schedules the ProductDownloadBatch.
     
    public void execute(SchedulableContext sc){
        Batchdemo9 inst = new Batchdemo9();
        ID batchprocessid = Database.executeBatch(inst);
    }
}