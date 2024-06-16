public class InsertAccountrecord {
    public static void Accountmethod(){
        list<Account>acclist=new list<Account>();
        for(integer i=0;i<15;i++)
        {
            account acc=new account();
            acc.name='siri'+i;
            acclist.add(acc);
            System.debug(acc);
        }
        System.debug(acclist);
    }

}