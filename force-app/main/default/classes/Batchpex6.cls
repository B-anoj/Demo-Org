//Create Batch class which will show Last 30 days closed won Opportunity & total Amount generated for that user.

public class Batchpex6 implements Database.Batchable<sObject>{  
    public Database.QueryLocator start(Database.BatchableContext bc){
        String userId = UserInfo.getUserId();
        return Database.getQueryLocator([Select Id,StageName,CloseDate,Amount from Opportunity where OwnerId =:userId 
                                         And StageName ='closed Won' And CloseDate >= LAST_N_DAYS:30
                                        ]);
    }
    
    public void execute(Database.BatchableContext bc,List<Opportunity> opps){
        if(!opps.isEmpty()){
            Decimal TotalAmount =0;
            for(Opportunity opp : opps){
                TotalAmount = TotalAmount + opp.Amount;
            }
            System.debug(TotalAmount);
        }
        
    }
    
    public void finish(Database.BatchableContext bc){
        System.debug('All opportunities are Displayed.........');
    }
}