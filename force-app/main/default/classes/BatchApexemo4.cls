//Create a batch class to calculate the total number of amount of all related Opportunities for each Account.

public class BatchApexemo4 implements Database.Batchable<sObject>{
     public DataBase.QueryLocator start(Database.BatchableContext bc){
        return DataBase.getQueryLocator ('Select Id,Name,sumoftotalopportunityamountvalue__c,(select Id,amount from Opportunities) from Account limit 5');
     }
     public void execute(Database.BatchableContext bc, List<Account> acclist ){
         System.debug('Account record' +acclist);
         list<Account> lsacc = new list<Account>();
         Decimal amountvalue = 0;
         for(Account acc : acclist){
             for(Opportunity opp : acc.Opportunities){
                 amountvalue += opp.amount;
             }
             acc.sumoftotalopportunityamountvalue__c = amountvalue; 
             lsacc.add(acc);
         }
         update lsacc;
         system.debug('lsacc---->'+lsacc);
         
     }
    
    /* public void execute(Database.BatchableContext bc, List<Account> acclist ){
         System.debug('Account record' +acclist);
         set<Id> accId = new set<Id>();
         for(Account acc: acclist){
             accId.add(acc.Id);
         }
         Decimal sumofValue=0;
         Map<Id,Decimal> mapOfAccountIdOppamount = new  Map<Id,Decimal>();
           for (AggregateResult agg : [SELECT AccountId, SUM(Amount) totalAmount 
                                FROM Opportunity 
                                WHERE AccountId IN :accId 
                                GROUP BY AccountId]) {
        
                                    
     }*/
    
     public void finish(Database.BatchableContext bc){
        System.debug('Success');
        
    }


}