trigger opportunityownerisupdateaccountownerchange on Opportunity (after update) {
    set<id> lsset=new set<id>();
    for(opportunity opp:trigger.new){
        lsset.add(opp.AccountId);
    }
    list<Account>updateowner=[select id,name,OwnerId,(select id,name,ownerId from Opportunities) 
                              from account where Id in:lsset];
    for(account acc:updateowner){
        for(opportunity opps:acc.Opportunities){
            acc.OwnerId=opps.OwnerId;
            update updateowner;
        }
        
        
    }
}