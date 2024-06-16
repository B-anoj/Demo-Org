public class QueueableDemo2forRelatedContact implements Queueable {
    public void execute(QueueableContext context) {
        Set<Id> setOfAccountId = new Set<Id>(); 
        List<Account> accList = [SELECT Id, Name, IsProcessed__c, (SELECT Id, LastName, Description FROM Contacts) FROM Account];
        System.debug('Account related contacts are: ' + accList);
        
        for (Account acc : accList) {
            List<Contact> contactList = acc.Contacts;
            for (Contact con : contactList) {
                con.Description = 'Related to updated Account';
                System.debug('Contact records: ' + con);
            }
        }
        update accList;
        System.debug('Updated records: ' + accList);
    }
}