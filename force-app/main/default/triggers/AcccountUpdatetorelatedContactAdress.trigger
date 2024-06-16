trigger AcccountUpdatetorelatedContactAdress on Account (after insert,after Update) {
    list<contact> conlist=new list<contact>();
    list<contact> conlistinsert=new list<contact>();
    
    set<id> accsetid=new set<id>();
    for(Account acc:trigger.new)
    {
        accsetid.add(acc.Id);
    }
    list<contact> contactupdate=[select id,Address__c from contact where AccountId in:accsetId];
    for(Account acc:trigger.new)
    {
        for(contact con:contactupdate)
        {
            con.Address__c=acc.Address__c;
            conlist.add(con);
        }
        if(contactupdate.size()==0){
            contact  c=new contact ();
            c.LastName=acc.name;
            c.AccountId=Acc.Id;
            c.Address__c=acc.Address__c;
            conlistinsert.add(c);
        }
        
        
    }
    insert conlistinsert;
    update conlist;
}