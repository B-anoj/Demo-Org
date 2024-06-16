trigger Accountphupdatecontactph on Account (after update) {
    
    //list<contact> conlist = new list<contact>();
    set<id> lsset=new set<id>();
    for(Account acc:trigger.old)
    {
        lsset.add(acc.Id);
    }
    list<contact> updatecon=[select accountid,name,phone from contact where accountId in :lsset];
    for(Account acc:trigger.old)
    {
        for(contact con:updatecon)
        {
            con.phone=acc.phone;
            //conlist.add(con);
            
        }
    }
   //insert conlist;
    update updatecon;

}