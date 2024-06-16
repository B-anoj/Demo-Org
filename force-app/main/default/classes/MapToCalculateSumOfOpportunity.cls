public class MapToCalculateSumOfOpportunity {
    public static void opportunitySum(List<Opportunity>NewList,Map<Id,Opportunity>OldMap){
        Set<Id> SetofAccountId = New Set<Id>();
        For(Opportunity opp : NewList){
        SetofAccountId.add(opp.AccountId);
        }
        Map<Id,Decimal> MapofOpportunity = New Map<Id,Decimal>();
        for(Opportunity opp:[select Id,Name,AccountId, Amount from Opportunity]){
            if(MapofOpportunity.containsKey(opp.AccountId)){
                MapofOpportunity.put(Opp.AccountId,MapofOpportunity.get(opp.AccountId)+Opp.amount);
            }
               else{
                   MapofOpportunity.put(opp.AccountId,opp.amount);
               }
        }
    }
}