public class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(String Fsname) {
        List<Contact> conListToRecord = [SELECT Id, FirstName, LastName, Email, Phone FROM Contact Where FirstName like :Fsname +'%'];
         //conListToRecord.sort();
         return  conListToRecord;       
    }

     @AuraEnabled(cacheable=true)
    public static List<Contact> getContactsdata(String accId) {
        return [
            SELECT AccountId, Id, FirstName, LastName, Title, Phone, Email
            FROM Contact
            WHERE AccountId = :accId
            WITH SECURITY_ENFORCED
        ];
    }

}