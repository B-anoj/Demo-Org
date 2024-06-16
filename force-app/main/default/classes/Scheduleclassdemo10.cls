global class Scheduleclassdemo10 implements Schedulable {
    global void execute(SchedulableContext sc) {
        Batchdemo10 batch = new Batchdemo10();
        Database.executeBatch(batch);
    }
}