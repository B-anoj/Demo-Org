public class scenariofirstContactcontroller {
    @AuraEnabled
    public static Contact cretconrecord(String recId, String FirstName, String LastName, String Email,String Role) {
        System.debug('recId===>'+recId);
        System.debug('FirstName===>'+FirstName);
        System.debug('LastName===>'+LastName);
        System.debug('Email===>'+Email);
        System.debug('Role===>'+Role);
      
       Contact con = new Contact();
       // con.Id = recId;
        con.FirstName = FirstName;
        con.LastName = LastName;
        con.Email = Email;
        con.Role__c = Role;
       // lslead.add(ld);
        insert con;
        System.debug('con===>'+con);
        return con;
    }

    // @AuraEnabled(cacheable=true)
    // public static List<sObject> f_Get_Types(){
    //     try {
    //         List<sObject> l_Types = new List<sObject>();
             
    //         l_Types = [Select id, FirstName,Role__C from Contact]; 
             
    //         return l_Types;
    //     } catch (Exception e) {
    //         System.debug('Exception: '+e.getMessage());
    //         return null;
    //     }
    // }

}