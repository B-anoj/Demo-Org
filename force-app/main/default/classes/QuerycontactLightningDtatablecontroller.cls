public class QuerycontactLightningDtatablecontroller {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContact() {
        List<Contact> contactsList = new List<Contact>();
        try {
            contactsList = [SELECT Id, FirstName, LastName, Email,Phone FROM Contact LIMIT 5];
        } catch (Exception e) {
            contactsList = new List<Contact>(); 
            System.debug('Exception occurred: ' + e.getMessage());
        }
       return contactsList;
    }
}