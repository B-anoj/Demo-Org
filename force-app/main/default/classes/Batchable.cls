Global class Batchable implements Database.Batchable<sObject> {
    Global Database.QueryLocator start(Database.BatchableContext bcontext){
        string accountdata='seelct id,name,rating,Active__c,annualrevenue from account';
        return  Database.getQueryLocator(accountdata);
    }
    Global void execute(Database.BatchableContext bcontext,list<account>lsacc){
        for(account acc:lsacc){
            acc.annualrevenue=20000;
            acc.Active__c='yes';
            acc.rating='hot';
            
        } update lsacc;
        System.debug('updated record are'+lsacc);
        
    } 
    Global void finish(Database.BatchableContext bcontext){
        system.debug('batch job is done');
        messaging.SingleEmailMessage email=new messaging.SingleEmailMessage();
        string[] toaddress=new string[]{'samalbanoj253@gmail.com'};
            //email.setToAddress(toaddress);
            //email.setToSubject('batch job is complete');
            //email.setToReplyTo('pinnacleo234@gmail.com');
            
            
    }
    
    
}