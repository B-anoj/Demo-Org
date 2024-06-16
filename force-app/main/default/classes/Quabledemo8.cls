//: Data Cleansing Operation on a Custom Object
//•	Objective: Identify and correct data anomalies in MyCustomObject__c.
//•	Details: The Queueable class should find records 
// with missing or incorrect data in certain fields (e.g., Email__c, Phone__c) and update them or flag them for review.
//•	Key Learning: Data validation, anomaly detection.

public class Quabledemo8  implements Queueable{
    public void execute(QueueableContext context){
        set<Id> contactIdSet = new set<Id>();
        Map<Id,Contact> MapOfId = New Map<Id,Contact>();
        List<contact> allContacts = [select id,name,Email,Phone,IsCheck__c from contact where IsCheck__c = False];
        Integer consize = allContacts.size();
        System.debug('Contact Size === >' +consize);
        list<Contact> contactListToUpdate = New List<Contact>();
        for(Contact cons : allContacts){
           contactIdSet.add(cons.Id); 
        }
        
        
        for(Contact con : [Select id,Name,Email,Phone from Contact where Id In : contactIdSet]){
            if((con.phone == null) || (con.Email == null) ||  (con.phone != null &&  String.valueOf(con.phone).length() < 10)){
                con.phone= '778909051676';
                con.IsCheck__c = True;
                con.Email ='Samalbanoj253@gmail.com';
                MapOfId.put(con.id,con);
                
            }
           /* if(con.Email == null){
                con.Email ='Samalbanoj253@gmail.com';
                con.IsCheck__c = True;
                MapOfId.put(con.id,con);
            }*/
        }
        if(contactListToUpdate.size()>0){
            update MapOfId.values();
            System.debug('update contact size ====>' +contactListToUpdate.size());
        }
       /* while (startPoint < consize) {
            Integer EndPoint = startPoint + batchSize;
            if (EndPoint > consize) {
                EndPoint = consize;
            }
            
            List<Contact> allContactsToUpdate = new List<Contact>();
            
            for (Integer i = startPoint; i < endpoint; i++) {
                Contact con = allContacts[i];
                if(con.phone == null || (con.Email == null || String.valueOf(con.Phone).length() != 10)){
                    con.IsCheck__c = False;
                }
                allContactsToUpdate.add(con);
            }
            
            if (!allContactsToUpdate.isEmpty()) {
                update allContactsToUpdate;
            }
            System.debug('All contact update' +allContactsToUpdate);
            
            startPoint = endpoint;
        } */
        
    }
    
}