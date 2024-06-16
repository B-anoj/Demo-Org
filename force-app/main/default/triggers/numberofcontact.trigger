trigger numberofcontact on Account (before insert) {
    set<id> lsset=new set<id>();
    
    //list<Account>countcon=[select id,name,No_Of_Contact__c,(select id,name from contacts) from accounts where id in : lsset];
    
    

}