public class preventduplicatecls {
    public static void meth(list<Account>newlist){
        set<string> lsset=new set<string>();
        for(account acc:newlist){
            lsset.add(acc.name);
        }
        list<account>lsaccount=[select id,name from account where name in :lsset];
        for(account a:newlist){
            if(lsaccount.size()>0){
                a.addError('name is duplicate');
            }
        }
        
    }
    
}