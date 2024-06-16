public class soql {
    public static void maeth(){
        list<Account> lsacc=[select id,name,createddate from Account order by createddate desc limit 2];
        for(Account acc:lsacc)
        {
            system.debug(acc);
        }
        
    }
    
    
    public static void metha(string textname){
        list<Account>lsacc=[select id,name from account where name =:textname];
        system.debug('Account size is' +lsacc.size());
        for(Account acc:lsacc)
        {
            system.debug('account name'+acc.name);   
        }
    }
    
}