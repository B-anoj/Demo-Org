trigger sendMailAccountTypeChange on Account (after update) {
    Set<Id> updatedAccountIds = new Set<Id>();

    for (Account updatedAccount : Trigger.new) {
        Account oldAccount = Trigger.oldMap.get(updatedAccount.Id);
        
        if (updatedAccount.Type != oldAccount.Type) {
            updatedAccountIds.add(updatedAccount.Id);
        }
    }

    if (!updatedAccountIds.isEmpty()) {
        List<Contact> contactList = [SELECT Id, LastName, Email, AccountId, Account.Name 
                                     FROM Contact 
                                     WHERE AccountId IN :updatedAccountIds 
                                     AND Email != null];
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();

        if (!contactList.isEmpty()) {
            for (Contact conObj : contactList) {
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setTargetObjectId(conObj.Id);
                mail.setSenderDisplayName('System Administrator');
                mail.setUseSignature(false);
                mail.setBccSender(false);
                mail.setSaveAsActivity(false);
                mail.setSubject('Account Update Info');
                String body = 'Dear ' + conObj.LastName + ',\n\n';
                body += 'Your account information has been updated successfully.\n\n';
                body += 'Account Name: ' + conObj.Account.Name;
                mail.setPlainTextBody(body);
                mail.setToAddresses(new String[]{conObj.Email});
                emailList.add(mail);
            }
            
            System.debug('Emails to be sent: ' + emailList);
            
            if (!emailList.isEmpty()) {
                Messaging.SendEmailResult[] results = Messaging.sendEmail(emailList);
                for (Messaging.SendEmailResult result : results) {
                    if (result.success) {
                        System.debug('The email was sent successfully.');
                    } else {
                        System.debug('The email failed to send: ' + result.errors[0].message);
                    }
                }
            }
        }
    }
}