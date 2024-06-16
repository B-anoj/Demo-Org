public class batchannualratingupdate implements Database.Batchable<SObject>{
    public Database.QueryLocator start(Database.BatchableContext bcontext){
        string lsaccupdate='select id,name,rating,annualrevenue from account';
        return Database.getQueryLocator(lsaccupdate);
        
    }
    public void execute(Database.BatchableContext bcontext,list<Account>lsacc){
        for(Account acc:lsacc){
            acc.rating='hot';
            acc.annualrevenue=5000;
        }update lsacc;
        
    }
    public void finish(Database.BatchableContext bcontext){
        
        
    }

}