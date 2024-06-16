public class ContactPhoneUpdateAccPhoneUpdate {
    public static void contactMethod(List<Contact> NewList) {
        try {
            Set<Id> accountIds = new Set<Id>();
            for (Contact con : NewList) {
                accountIds.add(con.AccountId);
            }
            
            // Query Accounts with related Contacts
            List<Account> accountsToUpdate = [SELECT Id, Name, Phone, (SELECT Id, LastName, Phone FROM Contacts) FROM Account WHERE Id IN :accountIds LIMIT 1];
             System.debug('Updated accounts: ' + accountsToUpdate);
            for (Account acc : accountsToUpdate) {
                // Loop through Contacts and update Account Phone
                for (Contact con : acc.Contacts) {
                    //acc.Id = con.AccountId;
                    System.debug('Account Id '+acc.Id);
                    System.debug('Contact Id '+con.Id);
                    acc.Phone = con.Phone;
                    System.debug('Account Phone '+acc.Phone);
                }
            }
            update accountsToUpdate;
            System.debug('Updated accounts: ' + accountsToUpdate);
        } catch (Exception e) {
            System.debug('An error occurred: ' + e.getMessage() + ' at Line Number ==> ' + e.getLineNumber());
        }
    }
}