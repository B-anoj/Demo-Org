trigger oppamont on Opportunity (after insert) {
    set<id>accountid=new set<id>();
    for(Opportunity opp:trigger.new ){
          accountid.add(opp.AccountId);
    }
    list<account>lsaccount = [select id,Total_opp_Amount__c,(select Amount from Opportunities ) 
                              from account where id in:accountid]; 
    decimal amount=0;
    for(account acc:lsaccount){
        for(Opportunity op:acc.Opportunities){
            amount +=op.Amount;
        }
        acc.Total_opp_Amount__c=amount;
    }update lsaccount;
    
}