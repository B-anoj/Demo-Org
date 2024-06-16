public class Countcontacttrigger {
    public static void meth1(list<contact>Newlist){
        set<id>lsset=new set<id>();
        list<account> lsacc=new list<account>();
        for(Contact con:Newlist){
            lsset.add(con.accountId);
        }
        list<Account>updateaccount=[select id,name,phone,No_Of_Contact__c,(select id,name from contacts) 
                                    from account where id in: lsset];
        System.debug('update value is'+updateaccount);
        for(contact con:Newlist){
            for(Account acc:updateaccount)
            {
                acc.No_Of_Contact__c=acc.contacts.size();
            }
        }
        update updateaccount;   
    }
}