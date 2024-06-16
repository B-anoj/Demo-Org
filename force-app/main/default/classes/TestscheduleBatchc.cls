public class TestscheduleBatchc implements Database.Batchable<Sobject>
{
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        //1 million-2000 record to execute
        return Database.getQueryLocator('select id,Name from Account');
    }
    public void execute(Database.BatchableContext bc,list<Account> sublistfromstartmethod)
    {
        //logic to process all 2000 records
        for(Account acc:sublistfromstartmethod)
        {
            acc.name='Batch Update-'+acc.name;
        }
        system.debug(sublistfromstartmethod);
        update sublistfromstartmethod;
    }
    public void finish(Database.BatchableContext bc)
    {
        //post process logic
        System.debug('Batch job is done');
        //this is how you need chain yours job.
        Database.executeBatch(new TestDemoContactBatch());
    }
}