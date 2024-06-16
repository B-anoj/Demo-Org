public class updateTasksForAccountController {
    
    @AuraEnabled
    public static List<Task> getTaskrecords(Id accId){
        List<Task> taskRec = [SELECT Id, Subject, Status, OwnerId FROM Task WHERE WhatId = :accId];
        return taskRec;      
    }
    
}