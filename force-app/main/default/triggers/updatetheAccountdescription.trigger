trigger updatetheAccountdescription on Account (after update) {
    list<Opportunity> opplist=new list<Opportunity>();
    set<id> accsetId=new set<id>();
    for(Account acc:trigger.new)
    {
        accsetId.add(acc.id);
    }
    list<Opportunity>updateopp=[select accountid,Description from Opportunity where AccountId in:accsetId];
    for(Account acc:trigger.new)
    {
        for(opportunity opp:updateopp)
        {
                 
                opp.Description=acc.Description;
                opplist.add(opp);
        }
    }
    update opplist;
    
    
}