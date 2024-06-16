trigger Accountphoneupdateconphoneupdate1 on Account (after insert,after update) {
    set<id>lsset=new set<id>();
    for(account acc:trigger.new){
        lsset.add(acc.Id);
    }
   
    list<contact>updatecon=[select accountid,account.phone,account.description,account.fax,firstname,phone,description,fax from contact where accountid in:lsset];
     for(contact con:updatecon)
     {
         con.phone=con.account.phone;
         //con.description=con.account.description;
         con.fax=con.account.fax;
      
     }
    update updatecon;
    
}