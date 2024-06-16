public class customLookupHandler {
    @AuraEnabled(cacheable=true)
    public static List<sObject> f_Get_Types(){
        try {
            List<sObject> l_Types = new List<sObject>();
             
            l_Types = [Select id, FirstName,Role__C from Contact]; // Can include multiple fields, 
            // You can also use any standard or custom object
            // You can get values from custom setting also.
             
            return l_Types;
        } catch (Exception e) {
            System.debug('Exception: '+e.getMessage());
            return null;
        }
    }
}