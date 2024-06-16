public class scenariofirstAccountcontroller {
     @AuraEnabled
    public static Account cretaccrecord(String recId, String Name, String Phone) {
       Account acc = new Account();
       acc.Name = Name;
       acc.Phone = Phone;
       insert acc;
       return acc;
    }
}