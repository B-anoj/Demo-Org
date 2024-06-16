trigger oppstgchng on Opportunity (after update) {
    Set<Id> accountIds = new Set<Id>();
    
    for (Opportunity opp : Trigger.new) {
        Opportunity oldOpp = Trigger.oldMap.get(opp.Id);
        
        
        if (opp.StageName != oldOpp.StageName && opp.AccountId != null) {
            accountIds.add(opp.AccountId);
        }
    }
    
    if (!accountIds.isEmpty()) {
        Map<Id, List<Contact>> accountContactsMap = new Map<Id, List<Contact>>();
        
               for (Contact con : [SELECT Id, AccountId, Email 
                             FROM Contact 
                             WHERE AccountId IN :accountIds]) {
            if (!accountContactsMap.containsKey(con.AccountId)) {
                accountContactsMap.put(con.AccountId, new List<Contact>());
            }
            accountContactsMap.get(con.AccountId).add(con);
        }
        
        List<Messaging.SingleEmailMessage> emailsToSend = new List<Messaging.SingleEmailMessage>();
        
        for (Opportunity opp : Trigger.new) {
            if (accountContactsMap.containsKey(opp.AccountId)) {
                List<Contact> contacts = accountContactsMap.get(opp.AccountId);
                
                for (Contact con : contacts) {
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setToAddresses(new String[]{ con.Email });
                    mail.setSubject('Account Update Info');
                    mail.setPlainTextBody('Your account information has been updated successfully.');
                    emailsToSend.add(mail);
                }
            }
        }
        
        // Send emails
        if (!emailsToSend.isEmpty()) {
            Messaging.sendEmail(emailsToSend);
        }
    }
}