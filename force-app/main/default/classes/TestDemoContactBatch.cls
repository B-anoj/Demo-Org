public class TestDemoContactBatch implements Database.Batchable<sObject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        //1 million-2000 record to execute
        return Database.getQueryLocator('select id,LastName from Contact');
    }
    public void execute(Database.BatchableContext bc,list<contact> sublistfromstartmethod)
    {
        //logic to process all 2000 records
        for(Contact con:sublistfromstartmethod)
        {
            con.lastname='batchupdate-'+con.lastname;
        }
        system.debug(sublistfromstartmethod);
        update sublistfromstartmethod;
    }
    public void finish(Database.BatchableContext bc)
    {
        //post process logic
        System.debug('Batch job is done');
    }
}