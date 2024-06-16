trigger WhenContactcreateAccountratinhot on Contact (after insert,after update) {
   set<id>setid=new set<id>();
    for(contact con:trigger.new)
    {
        setid.add(con.AccountId);
    }
    list<Account>lsupdate=[select id,rating from Account where ID In:setid];
   
        for(Account acc:lsupdate)
        {
            acc.rating='hot';  
        }
    update lsupdate;

}