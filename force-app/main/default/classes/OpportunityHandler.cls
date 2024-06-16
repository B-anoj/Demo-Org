public class OpportunityHandler {
    @AuraEnabled(cacheable=true)
    public static list<opportunity> opmethod(){
        list<Opportunity> opplist = [SELECT id,Name,StageName,CloseDate from opportunity LIMIT 5];
        System.debug('opplist====>'+opplist);
        return opplist;    
    }
}