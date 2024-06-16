trigger whencontactupdateautomaticallyaccoutuodated on Contact (after insert,after update) {
    set<id> lsset=new set<id>();
    
    for(contact con:trigger.new){
        lsset.add(con.accountId);
    }
    list<Account>updateacc=[select id,name,phone,description,(select id,firstname,phone from contacts) 
                            from account where Id in:lsset];
    
    List<account>accList= new List <account>();
    
    for(Account acc:updateacc){
        for(contact con:acc.contacts){
            acc.name=con.firstname;
            acc.phone=con.phone;
            acc.description=con.description;
            accList.add(acc);          
        }   
    }
    update accList;
}