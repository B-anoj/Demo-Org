//Create a batch class to delete Opportunity records whose created date is older than 6 months.

public class BatchApex3 implements Database.Batchable<sObject> {
    public DataBase.QueryLocator start(Database.BatchableContext bc){
        Date SixMonthBefore = Date.Today().addMonths(-6);      
        return Database.getQueryLocator([SELECT Id,CreatedDate FROM Opportunity WHERE CreatedDate < : SixMonthBefore]);
    }
    public void execute(Database.BatchableContext bc, List<Opportunity> OpportunityList){
       // List<Opportunity> deleteopp = (list<Opportunity>)OpportunityList;
        delete OpportunityList;
        System.debug('Deleted opportunity'+OpportunityList);
    }
   
    
     public void finish(Database.BatchableContext bc){
        System.debug('Success');
        
    }

}