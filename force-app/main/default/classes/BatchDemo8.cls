//When Opportunity closed Lost then create task for that user and send Email Notification, 
//if user did not completed the task with a week send again email notification
Public class BatchDemo8 implements  System.Schedulable{
    Public void Execute(System.SchedulableContext sc){
        Date oneWeekAgo = Date.today().addDays(-7);
        List<Task> openTasks = [SELECT Id, WhoId, CreatedDate, Subject,Owner.Email
            FROM Task WHERE CreatedDate >= : oneWeekAgo];
    } 
}