trigger sumofopportunityvalue on Opportunity (after insert) {
    set<id> lsset=new set<id>();
    for(opportunity opp:trigger.new){
        lsset.add(opp.AccountId);
    }
    list<account> lsaccupdate=[select id,sumoftotalopportunityamountvalue__c,(Select id,amount from opportunities) 
                              from account where id in :lsset];
    System.debug('update account list is'+lsaccupdate);
    decimal amountval=0;
    for(account acc:lsaccupdate){
        for(opportunity opps:acc.opportunities){
            amountval += opps.Amount;
            system.debug('opportunity value is'+opps);
        }
        System.debug('2nd update account list is'+acc);
        acc.sumoftotalopportunityamountvalue__c=amountval;
    }
    update lsaccupdate;
    System.debug('3rd update account list is'+lsaccupdate);
}