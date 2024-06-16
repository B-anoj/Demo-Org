trigger AccountisAssociateOpportunity on Account (after insert,after update) {
    list<Opportunity> Opplist=new list<Opportunity>();
    for(Account acc:trigger.new)
    {
       Opportunity opty=new Opportunity();
        opty.Accountid=acc.id;
        opty.Name=acc.Name;
        opty.StageName='Prospecting';
        opty.CloseDate=System.today();
        Opplist.add(opty);
    }
    insert Opplist;

}