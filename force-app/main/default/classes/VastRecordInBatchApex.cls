public class VastRecordInBatchApex implements Database.Batchable<sObject>{
    public DataBase.QueryLocator start(Database.BatchableContext bc){
        return DataBase.getQueryLocator ('SELECT Id FROM Contact WHERE Id = NULL');
    }
    public void execute(Database.BatchableContext bc, List<Contact> lscon){
        
        for(Integer i=0;i<9999;i++){
            Contact con =new Contact();
            con.LastName = 'Alexa'+ i;
            con.Description = 'Quable';
            lscon.add(con);
        }
        insert lscon;
        System.debug('The record are'+lscon);
        
    }
    
    
    public void finish(Database.BatchableContext bc){
        System.debug('Success');
        
    }
    
}