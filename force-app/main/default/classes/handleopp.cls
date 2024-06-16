public class handleopp {
    public static void oppmeth(list<account>lsopp){
        list<opportunity>opplist=new list<opportunity>();
        for(account acc:lsopp){
            opportunity opp=new opportunity();
            opp.AccountId=acc.id;
            opp.name=acc.name;
            opp.StageName='prospecting';
            opp.CloseDate=system.today();
            opplist.add(opp);
        }
        insert opplist;
        
    }
    
}