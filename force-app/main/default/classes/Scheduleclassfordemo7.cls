Public class Scheduleclassfordemo7 implements Schedulable{
     Public void execute(SchedulableContext sc) {
        // Instantiate and execute the Batch class
        Batchdemo7 batch = new Batchdemo7();
        Database.executeBatch(batch);
    }

}