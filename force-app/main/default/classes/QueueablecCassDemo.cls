public class QueueablecCassDemo implements Queueable{
    public void execute(QueueableContext qc){
        //write any logic to run asynchronous
        list<Account> sublistfromstartmethod=[select id from Account];
        for(Account acc:sublistfromstartmethod)
        {
            acc.name='Batch Update-'+acc.name;
        }
        system.debug(sublistfromstartmethod);
        update sublistfromstartmethod;
    }
}