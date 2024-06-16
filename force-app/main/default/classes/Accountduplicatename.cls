//duplicate name in account 
public class Accountduplicatename {
    public static void accountmeth(List<Account>NewList){
        set<String>lsname=new set<String>();
        set<String>lsPhone=new set<string>();
        for(account acc:NewList){
            lsname.add(acc.name);
            lsPhone.add(acc.Phone);
        }
        list<Account>updateacc=[select id,name,phone from account where 
                                name in: lsname or phone in : lsPhone];
        for(Account acc:NewList){
            if(updateacc.size()>0){
                acc.addError('duplicate name and phone not inserting');
               // acc.addError('duplicate phone not inserting');
                
            }
        }
    }

}