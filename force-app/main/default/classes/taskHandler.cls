public class taskHandler {
    @AuraEnabled
    public static List<Task> getTaskrecord(Id recId){
      //  System.debug('recId==> ' + recId);
        //return [SELECT Id, Subject, Status, OwnerId FROM Task WHERE WhatId = :recId];
        List<Task> taskRec = [SELECT Id, Subject, Status, OwnerId FROM Task WHERE WhatId = :recId];
          System.debug('taskRec==> '+taskRec);
        return taskRec;      
    }

    @AuraEnabled
    public static void updateTasks(List<Id> taskIds, String newStatus){
        List<Task> tasksToUpdate = new List<Task>();
        for (Id taskId : taskIds) {
            Task task = new Task();
            task.Id = taskId; 
            task.Status = newStatus;
            tasksToUpdate.add(task);
        }
        update tasksToUpdate;
    }

//  @AuraEnabled
//     public static void updateTasks1(List<Id> taskIds, String newStatus){
//         List<Task> tasksToUpdate = new List<Task>();
//         for (Id taskId : taskIds) {
//             Task task = new Task();
//             task.Id = taskId; 
//             task.Status = newStatus;
//             tasksToUpdate.add(task);
//         }
//         update tasksToUpdate;
//     }
    

    @AuraEnabled
    public static void updateTaskUsinJSON(List<TaskUpdateWrapper> taskDataList) {
        List<Task> tasksToUpdate = new List<Task>();
        for (TaskUpdateWrapper wrapper : taskDataList) {
            Task taskToUpdate = new Task(Id = wrapper.taskId);
            taskToUpdate.Status = wrapper.status;
            taskToUpdate.Subject = wrapper.subject;
            tasksToUpdate.add(taskToUpdate);
        }

        if (!tasksToUpdate.isEmpty()) {
            update tasksToUpdate;
            System.debug('tasksToUpdate===>'+tasksToUpdate);
            sendEmailAlertToRecordOwner(tasksToUpdate);
            System.debug('tasksToUpdate===>'+tasksToUpdate);
        }
    }  
  private static void sendEmailAlertToRecordOwner(List<Task> updatedTasks) {
     System.debug('tasksToUpdate1===>'+updatedTasks);
        List<Id> recordOwnerIds = new List<Id>();

        for (Task updatedTask : updatedTasks) {
            if (updatedTask.OwnerId != null) {
                recordOwnerIds.add(updatedTask.OwnerId);
            }
        }

     //   List<User> recordOwners = [SELECT Id, Email FROM User WHERE Id IN :recordOwnerIds];

        List<Messaging.SingleEmailMessage> emailMessages = new List<Messaging.SingleEmailMessage>();

      //  for (User recordOwner : recordOwners) {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new String[] {  UserInfo.getUserEmail() });
            email.setSubject('Task Updated');
            email.setPlainTextBody('One or more tasks related to your records have been updated.');
            emailMessages.add(email);
      //  }

        if (!emailMessages.isEmpty()) {
          //  Messaging.sendEmail(emailMessages);
        }
    }
    

    public class TaskUpdateWrapper {
        @AuraEnabled
        public String taskId { get; set; }
        @AuraEnabled
        public String status { get; set; }
        @AuraEnabled
        public String subject { get; set; }
    }

    @AuraEnabled
    public static List<Task> getAccountRelatedTask(String accountId){
      //  System.debug('accountId==> ' + accountId);
        //return [SELECT Id, Subject, Status, OwnerId FROM Task WHERE WhatId = :recId];
        List<Task> taskRecord = [SELECT Id, Subject, Status, OwnerId FROM Task WHERE WhatId = :accountId LIMIT 5];
        System.debug('taskRec==> '+taskRecord);
        return taskRecord;      
    }
}