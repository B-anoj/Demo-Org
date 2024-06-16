trigger contactdescandphtoaccount on Contact (after update) {
    set<id> lsset=new set<id>();
    for(contact con:trigger.new){
        lsset.add(con.accountid);
    }
    
    list<account> updateaccountlist=[select id,name,description,phone,(select id,description,phone from contacts) from account where id in : lsset];
    System.debug('the updated record are'+updateaccountlist);
    for(account acc:updateaccountlist){
        for(contact con:acc.contacts){  
          acc.description=con.description; 
          acc.phone=con.phone;  
          
        }
    }
    update updateaccountlist;
}