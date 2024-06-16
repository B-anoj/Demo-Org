public class upsertoper {
    public static void upsertmeth(){
        list<account> lsacc=new list<account>();
        
        //updatelist
        list<account>updatelist=[select id,name,rating from account where name like 'batch%' limit 500];
        for(account acc:updatelist)
        {
            acc.rating='hot';
            acc.name='Rohit';
            lsacc.add(acc);
            System.debug('updated record are '+lsacc);
            
        }        
        
        //insertlist
        // for(account accin:lsacc){
        account a=new account();
        a.name='banoj';
        lsacc.add(a);
        System.debug(lsacc);
        upsert lsacc;
    
    }
    
    //Write an apex program, to DeActivate the User based on the specified user name at runtime.
    
    public static void Deact(){
        
    }
}