public class scenariofirstOpportunitycontroller {
    @AuraEnabled
    public static Opportunity creteopprecord(String recId, String Name, String StageName) {
        Opportunity opp = new Opportunity();
        opp.Name = Name;
        opp.StageName = StageName;
       // lslead.add(ld);
        insert opp;
        return opp;
    }

}