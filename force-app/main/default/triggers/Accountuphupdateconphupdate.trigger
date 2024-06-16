/*.when account phone is update then automatically its contact phone is update.*/

trigger Accountuphupdateconphupdate on Account (after insert,after update) {
    
    set<id>lsset=new set<id>();
    for(Account acc:trigger.new)
    {
        lsset.add(acc.id);
    }
    list <contact> updatecon=[select id,accountid,phone from contact where accountid in: lsset];
    {
        //list<contact> lscon=new list<contact>();
        for(account acc:trigger.new)
        {
            for(contact con:updatecon)
            {
                con.phone=acc.phone;
                con.Fax=acc.Fax;
                con.Description=acc.Description;
                //update updatecon;
                update con;
            }
        }
     
    }   
}