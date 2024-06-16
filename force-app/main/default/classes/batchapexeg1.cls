public class batchapexeg1 implements Database.Batchable<sObject>{
    
    public Database.QueryLocator start (Database.BatchableContext bc){
        return Database.getQueryLocator ('select id,name from contact');
    }
    
    public void execute(Database.BatchableContext bc,list<contact>lscon){
        for(Contact con:lscon)
        {
            con.lastname='co'+con.lastname;
            System.debug(con);
        }
        update lscon;
        
    }
    public void finish(Database.BatchableContext bc){
        System.debug('Batch job is done');
        messaging.SingleEmailMessage mail=new messaging.SingleEmailMessage();
        string[] toAddress=new string[]{'samalbanoj253@gmail.com'};
        mail.setToAddresses(toAddress);
        Messaging.sendEmail(new messaging.SingleEmailMessage[]{mail});
        
        string emailcontent='dear customer support,<br></br>'+
        'batch job id is'+bc.getjobid();
        system.debug('the id is'+emailcontent);
        
        //calling one batch to another batch
        
        Batchable objnamee=new Batchable();
        Database.executeBatch(objnamee);
        
    }
}