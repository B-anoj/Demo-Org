public class TestDemoQueueable implements Queueable {
    public void execute(QueueableContext qc){
        //Write your logic that needs to run in background
        Delete[select id from case where createddate=LAST_YEAR];
    }

}