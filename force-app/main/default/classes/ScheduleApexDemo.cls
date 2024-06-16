public class ScheduleApexDemo implements schedulable {
    public void execute(SchedulableContext sc){
        //Any code written inside this method can be schedule
        Database.executeBatch(new TestscheduleBatchc());
    }

}