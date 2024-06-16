// //Create one Custom Field on Account as "Batch Executed" checkbox. Get all the Account records and update this field as true.
public class BatchclassDemo2 implements Database.Batchable<sObject>{
    public DataBase.QueryLocator start(Database.BatchableContext bc){
         return DataBase.getQueryLocator ('select id,BatchExecuted__c,Name from Account Limit 5');
    }
     public void execute(Database.BatchableContext bc, List<Account> lsaccount){
         for(Account acc :lsaccount){
              acc.BatchExecuted__c = true;
         }
         update lsaccount;
         System.debug('update value are:::'+lsaccount);
     }
    public void finish(Database.BatchableContext bc){
        System.debug('Success');
        
    }

}