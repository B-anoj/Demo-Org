trigger TReg1Accountdescchngoppdescchng on Account (after insert,after update) {
  list<Opportunity> lsopp=new list<Opportunity>();
    set<id> lsset=new set<id>();
    for(account acc:trigger.new)
    {
        lsset.add(acc.id);
    }
   list<opportunity>Updateopp=[select id,Description,accountid,name from opportunity where accountid in:lsset];
    for(account acc:trigger.new)
    {
    for(opportunity opp:updateopp)
    {
        opp.Description=acc.Description;
    }
   }
    update Updateopp;
}