trigger accountcrtconcrt1 on Account (after insert) {
    set<id> lsset=new set<id>();
    for(account acc:trigger.new){
        lsset.add(acc.id);
    }
    list<contact> updatecon=[select accountid,account.phone,account.fax, lastname from contact where accountid in:lsset];
    for(contact con:updatecon)
    {
        con.phone=con.account.phone;
        con.fax=con.account.fax;
    }
    update updatecon;
}