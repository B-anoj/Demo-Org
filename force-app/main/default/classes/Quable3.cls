//Error Handling in Queueable Apex on Lead Object
//•	Objective: Update a batch of Lead records and implement error handling.
//•	Details: The Queueable class should try to update the 'Status' field of Lead records. 
//If an error occurs, it should catch the exception and send an email to the admin.
//•	Key Learning: Exception handling, email notifications.

public class Quable3 implements Queueable{
    public void execute(QueueableContext context) {
        Integer batchSize = 200; 
         Integer startPoint = 0;
        List<Lead> leadsToUpdate = [SELECT Id, Status FROM Lead ]; 
        
        Integer totalLeads = leadsToUpdate.size();
        System.debug('Total leads to update: ' + totalLeads);
       
        while (startPoint < totalLeads) {
            Integer endPoint = startPoint + batchSize;
            if (endPoint > totalLeads) {
                endPoint = totalLeads;
            }
            List<Lead> leadsToUpdateWithNewStatus = new List<Lead>();
            
            for (Integer i = startPoint; i < endPoint; i++) {
                Lead lead = leadsToUpdate[i];
                
                lead.Status = 'New Status'; 
                
                leadsToUpdateWithNewStatus.add(lead);
            }
            
            try {
                update leadsToUpdateWithNewStatus;
                System.debug('Updated leads: ' + leadsToUpdateWithNewStatus);
            } catch (Exception e) {
                String adminEmail = 'samalbanoj132@gmail.com';
                String subject = 'Error occurred while updating Lead records';
                String body = 'An error occurred while updating Lead records. Error Message: ' + e.getMessage();
                
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setToAddresses(new String[]{ adminEmail });
                mail.setSubject(subject);
                mail.setPlainTextBody(body);
                
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            }
            startPoint = endPoint;
        }
    }
}