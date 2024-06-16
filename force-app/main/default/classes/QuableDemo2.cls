//Objective: First job updates all Account records by setting a custom field IsProcessed__c to true. 
//The second job updates all Contacts related to these Accounts, setting their Description to "Related to updated Account".
//Details: Two Queueable classes, where the first updates Accounts and the second, 
//triggered after the first completes, updates related Contacts.
//Key Learning: Chaining Queueable jobs, relationship queries.

public class QuableDemo2  implements Queueable{
    public void execute(QueueableContext context){
        List<Account> AccountToUpdate = New List<Account>();
        List<Account> AccountList = [Select Id,Name,IsProcessed__c from Account where IsProcessed__c = False];
        For(account acc : AccountList){
            //Account accs = new Account();
            acc.IsProcessed__c = True;
            // AccountToUpdate.add(accs);
        }
        Update AccountList;
        System.debug('Update Account record are :'+AccountList);
        System.enqueueJob(new QueueableDemo2forRelatedContact());
    }  
}