//Write a method to show Account with its associated contacts by using wrapper class.
public class Wrapper6 {
    public static accountdetails method6(list<account> ac){
        
        accountdetails wrap=new accountdetails();
        set<id> acid=new set<id>();
        for(account a:ac){
            acid.add(a.id);
        }
        list<contact> cons=[select id from contact where accountid in:acid];
        wrap.conlist=cons;
        system.debug('acc related cons::'+cons);
        return wrap;
    }
    public class accountdetails{
        public List<Contact> conlist;
    }

}