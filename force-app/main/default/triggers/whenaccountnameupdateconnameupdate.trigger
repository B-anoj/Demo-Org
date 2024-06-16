trigger whenaccountnameupdateconnameupdate on Account (after update) {
    set<id> lsset=new set<id>();
    for(Account acc:trigger.new){
         lsset.add(acc.Id);
    }
    list<contact>lscontact=[select accountId,account.name,account.phone,account.description,account.fax,Id,Firstname,
                            phone,description,fax from 
                            contact where accountId in : lsset];  
   
    for(contact con:lscontact)
    {
        con.Firstname=con.account.name;
        con.phone=con.account.phone;
        con.description=con.account.description;
        con.fax=con.account.fax;
        
    }
    update lscontact;
   

}