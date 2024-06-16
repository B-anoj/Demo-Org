public class TaskController {
   @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [SELECT Id, Name,Phone FROM Account limit 5];
    }
    @AuraEnabled
    public static list<Task> getRelatedTasks(Id accountId){
        return [SELECT Id,Subject, Status,Priority FROM Task WHERE WhatId = : accountId];
    }

    @AuraEnabled
    public static Task updateTask(String accountId, String taskSubject, Date taskActivityDate, String taskStatus, String taskPriority) {
            Task existingTask = [SELECT Id, Subject, ActivityDate, Status, Priority From Task where WhatId = : accountId limit 1];
                //existingTask.WhatId = accountId;
                existingTask.Subject = taskSubject;
                existingTask.ActivityDate = taskActivityDate;
                existingTask.Status = taskStatus;
                existingTask.Priority = taskPriority;
                update existingTask;
                system.debug('existingTask---->'+existingTask);
                return existingTask;     
            }
            
            
}