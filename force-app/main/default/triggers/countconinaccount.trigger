trigger countconinaccount on Contact (after insert,after update) {
    set<id> setid=new set<id>();
    for(contact con:trigger.new)
    {
        setid.add(con.Accountid); 
    }
    list<Account>updateacc=[select id,name,phone,No_Of_Contact__c,(select id from contacts)from account where id in:setid];
    for(Account acc:updateacc)
    {
        for(contact con:trigger.new)
        {
            //acc.phone=con.phone;
            acc.No_Of_Contact__c=acc.contacts.size();
            
            
        }
        update updateacc;
        
    }
}