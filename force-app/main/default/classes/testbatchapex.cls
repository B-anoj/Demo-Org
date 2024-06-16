public class testbatchapex implements Database.Batchable<sObject>,Database.Stateful {
    decimal totalannualrevenue=0.0;
    public Database.QueryLocator start(Database.BatchableContext bcontext){
        string accountdata='select id,name,annualrevenue,rating from account';
        return Database.getQueryLocator(accountdata);
    }
    public void execute(Database.BatchableContext bcontext,list<account>lsacc){
        for(Account acc:lsacc){
            totalannualrevenue=acc.AnnualRevenue+totalannualrevenue;
            System.debug('the annual revenue is'+acc);
        }
        
    }
    public void finish(Database.BatchableContext bcontext){
        System.debug('Batch job id is'+bcontext.getjobId());
    }

}