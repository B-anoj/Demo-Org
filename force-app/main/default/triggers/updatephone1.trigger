trigger updatephone1 on Contact (after update) {
    set<id>conid=new set<id>();
    for(contact con:trigger.old){
        conid.add(con.AccountId);
    }
    list<account>lsaccount=[select id,phone,(select phone from Contacts) from account where id in:conid];
    
    for(Account acc:lsaccount){
        for(Contact conn:acc.Contacts){
            acc.phone=conn.Phone;
        }
    }update lsaccount;
    
}