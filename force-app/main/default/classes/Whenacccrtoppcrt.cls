//when account crt opp created.
public class Whenacccrtoppcrt {
    public static void oppcrtmeth(List<Account>NewList){
        list<Opportunity>lsopp=new list<Opportunity>();
        for(Account acc:NewList){
            Opportunity opp=new Opportunity();
            opp.accountId=acc.Id;
            opp.Name=acc.Name;
            opp.CloseDate=system.today();
            opp.StageName='prospecting';
            lsopp.add(opp);
        }
        insert lsopp;
        
    }

}