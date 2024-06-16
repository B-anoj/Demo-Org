public class Accountupdtae {
    public static void  m1(){
        list<account> lsacc=new list<account>();
        set<id> lsset=new set<id>();
        for(contact con:[select Id, name, Account.Id from contact where name like '%b%' and name in:lsset])
        {
            Account acc=new account();
            acc.id=con.Account.Id;
            acc.Rating='Hot';
            System.debug(acc);
            lsacc.add(acc);
            System.debug(lsacc);
        }
update lsacc;
        
        
        
    }
}