public class sumofoppvaluonacc {
    public static void sumoppmeth(List<Opportunity>NewList){
        set<id> lsopp=new set<id>();
        for(Opportunity opp:NewList){
            lsopp.add(opp.AccountId);
        }
        list<Account>updateacc=[select id,name,Total_opp_Amount__c,(select id,name,amount from opportunities) 
                                from Account where id in: lsopp];
        
        decimal totalval=0;
        
        for(Account acc:updateacc){
            for(Opportunity opp:acc.Opportunities){
                totalval=totalval+opp.amount;
            }
            acc.Total_opp_Amount__c=totalval;
        }
        update updateacc;      
    }

}