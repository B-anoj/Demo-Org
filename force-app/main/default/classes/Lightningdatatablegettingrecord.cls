public class Lightningdatatablegettingrecord {
    @AuraEnabled
    public static list<Contact> fetchContacts(){        
            list<Contact> lstContact = new list<Contact>();
            for(Contact con : [SELECT id,name,email,phone,title FROM Contact LIMIT 5000]){
                lstContact.add(con);
            } 
            return lstContact;        
    }

}