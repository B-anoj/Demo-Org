//Objective: Update the 'Description' field of all Contact records to "Updated via Queueable Apex".
//Details: Create a Queueable class that queries all Contact records and updates their 'Description' field.
//Key Learning: Basic Queueable Apex structure, SOQL query, and DML operation.

public class QuableClassdemo1 implements Queueable  {
    public void execute(QueueableContext context) {
        Integer Batchsize = 2000;
        List<Contact> ListOfContact = [SELECT Id, Description FROM Contact];
        Integer Totalconsize = ListOfContact.size();
        System.debug('Total contact size: ' + Totalconsize);

        for (Integer startPoint = 0; startPoint < Totalconsize; startPoint += Batchsize) {
            Integer endpoint = startPoint + Batchsize;
            if (endpoint > Totalconsize) {
                endpoint = Totalconsize;
            }
            List<Contact> UpdatedContacts = new List<Contact>();

            for (Integer i = startPoint; i < endpoint; i++) {
                Contact con = ListOfContact[i];
                con.Description = 'Update Contact';
                UpdatedContacts.add(con);
            }
            System.debug('Updated contacts: ' + UpdatedContacts);
            if (!UpdatedContacts.isEmpty()) {
                update UpdatedContacts;
            }
        }
    }
}