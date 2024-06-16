public class Quabledemo1 implements Queueable{
    public void execute(QueueableContext context){
        Integer startingRecord =0;
        Integer Batchsize = 2000;
        Integer endingRecord;
        List<contact> ListOfContact = [select id,Description from contact];
        Integer Totalconsize = ListOfContact.size();
        System.debug('Total contact size'+Totalconsize);
        
        while (startingRecord < Totalconsize) {
            endingRecord = startingRecord + Batchsize;
            if (endingRecord > Totalconsize) {
                endingRecord = Totalconsize;
            }
            List<Contact> UpdatedContacts = new List<Contact>();
            
            for (Integer i = startingRecord; i < endingRecord; i++) {
                Contact con = ListOfContact[i];
                con.Description = 'Update demo';
                UpdatedContacts.add(con);
            }
            System.debug('Updated contact '+UpdatedContacts);
            if (!UpdatedContacts.isEmpty()) {
                update UpdatedContacts;
            }
            startingRecord = endingRecord;
        }
        
    }
}