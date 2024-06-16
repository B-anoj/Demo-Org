public class QuableToScheduledemo7 implements Schedulable{
    Public void execute(SchedulableContext sc) {
       
        Quabledemo7 queueableJob = new Quabledemo7();
        System.enqueueJob(queueableJob);
    }
}