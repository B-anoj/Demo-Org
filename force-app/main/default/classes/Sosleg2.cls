public class Sosleg2 {
    public static void soslmeth(){
        list<list<sObject>> lstrecord=[find 'tcs' in all fields returning
                                      account(name,phone),contact(id,name,phone)];
        
        list<account> lsacc=(list<account>)lstrecord[0];
        list<contact> lscon=(list<contact>)lstrecord.get(1);
        
        for(account acc:lsacc){
            System.debug('the test field is'+acc);
        }
        for(contact con:lscon){
            System.debug('the contact test field is'+con);
        }
    }

}