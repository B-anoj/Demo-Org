trigger countcon on Contact (after insert) {
    set <id> lsset=new set <id>(); 
    for(contact con:trigger.new){
        lsset.add(con.AccountId);
    }
    list<account>updatelsacc=[select id,No_Of_Contact__c,(select id,name from contacts) 
                              from account where id in :lsset];
    for(account acc:updatelsacc){
        //for(contact conn:acc.contacts){
            acc.No_Of_Contact__c=acc.contacts.size();
        //}
    }
    update updatelsacc;
}