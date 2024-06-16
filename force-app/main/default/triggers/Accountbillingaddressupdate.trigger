trigger Accountbillingaddressupdate on Account (after update) {
    list<contact> conlist=new list<contact>();
    set<id>setid=new set<id>();
    for(Account acc:trigger.new)
    {
        setid.add(acc.id);
    }
    list<contact> contactupdate=[select id,MailingAddress from contact where AccountId in :setid];
    for(Account acc:trigger.new)
    {
        for(contact con:contactupdate)
        {
            con.MailingCity=acc.BillingCity;
            con.MailingState=acc.BillingState;
            con.MailingPostalCode=acc.BillingPostalCode;
            conlist.add(con);
        }
    }
    update conlist;
    System.debug(conlist);
    
}