/*when account phone is update then automatically its contact phone is update.*/

trigger accountphoneupdateconphoneupdate on Account (after insert,after update) {
    list<contact> conList=new list<contact>();
    set<id>idset=new set<id>();
    for(account acc:trigger.new)
    {
      idset.add(acc.id);
    }
    list<contact>conlst=[select id,phone from contact where id in:idset];
    {
        for(account acc:trigger.new)
        {
            for(contact con:conlst)
            {
                
                con.phone=acc.phone;
                conList.add(con);
            }
        }
    }
    update conList;
    
}