public class AccountTriggerHandeler {
    public static void m1(list<Account> newlist){
        list<contact> listcon=new list<contact>();
        for(Account acc:newlist){
            contact con=new contact();
            con.lastname=acc.Name;
            con.firstname='kumar';
            con.AccountId=acc.Id;
            listcon.add(con);
        }
        insert (listcon);   
    }
    
    
}