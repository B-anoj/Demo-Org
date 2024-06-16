/*Whenever opportunity stagename =closedwon automatically update the account field rating=hot .*/

trigger opportunitystageownaccountishot on Opportunity (after insert,after update) {
    set<id>lsset=new set<id>();
    for(opportunity opp:trigger.new)
    {
        if(opp.StageName=='Closed Won')
        {
        lsset.add(opp.accountid);
        }
    }
    list<Account>lstupdate=[select id,name,rating from account where id in:lsset];
    for(account acc:lstupdate)
    {
      acc.rating='Hot';  
    }
    update lstupdate;

}