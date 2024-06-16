public class handleropty {
    public static void oppmeth(List<Account> newAccount) {
        List<Opportunity> lsopp = new List<Opportunity>();
        for (Account acc : newAccount) {
            Opportunity opp = new Opportunity();
            opp.AccountId = acc.Id;
            opp.Name = acc.Name;
            opp.StageName = 'Prospecting';  // Set the stage to 'Prospecting'
            opp.CloseDate = System.today();
            lsopp.add(opp);
        }
        insert lsopp;
    }
}