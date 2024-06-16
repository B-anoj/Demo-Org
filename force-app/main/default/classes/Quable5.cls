//•	Objective: Process records of a custom object MyCustomObject__c in batches.
//•	Details: Assume MyCustomObject__c has a large number of records.
// The Queueable class should process them in batches (e.g., 200 records per batch) and update a custom field Processed__c to true.
//•	Key Learning: Batch processing, handling large data volumes.
public class Quable5 implements Queueable{
   public void execute(QueueableContext context){
        Integer startPoint =0;
        Integer Batchsize = 200;
        Integer endpoint;
        List<contact> ListOfContact = [select id,IsCheck__c from contact];
        Integer Totalconsize = ListOfContact.size();
        System.debug('Total contact size'+Totalconsize);
        
        while (startPoint < Totalconsize) {
            endpoint = startPoint + Batchsize;
            if (endpoint > Totalconsize) {
                endpoint = Totalconsize;
            }
            List<Contact> UpdatedContacts = new List<Contact>();
            
            for (Integer i = startPoint; i < endpoint; i++) {
                Contact con = ListOfContact[i];
                con.IsCheck__c = True;
                UpdatedContacts.add(con);
            }
            System.debug('Updated contact '+UpdatedContacts);
            if (!UpdatedContacts.isEmpty()) {
                update UpdatedContacts;
            }
            startPoint = endpoint;
        }
        
    }    
}