public class Upsert1 {
    public static void upsertmeth(){
        list<account> lsacc=new list<account>();
        //update list of account
        list<Account>updatelsacc=[select id,name,rating from account where rating='hot' limit 20];
        for(account acc:updatelsacc){
            acc.rating='cold';
            lsacc.add(acc);
            System.debug('updated record are =========>'+lsacc);
        }
    //list<account>laacc=new list<account>();
    
    account a=new account();
    a.Name='Raju';
    lsacc.add(a);
    System.debug('inserted record is'+lsacc);    
    upsert lsacc;
    
    }

}