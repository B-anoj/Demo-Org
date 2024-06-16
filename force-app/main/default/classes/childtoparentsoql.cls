//child to parent soql record retrive.
public class childtoparentsoql {
    public static void soqlmet(){
        list<Contact> lscon=[select id,name,phone,account.name,account.phone from contact where AccountId !=null limit 2];
        
        
        if(!lscon.isEmpty())
        for(contact con:lscon){
            con.phone=con.account.phone;
        }
        
        if(!lscon.isEmpty()){
        update lscon;
        }
    }

}