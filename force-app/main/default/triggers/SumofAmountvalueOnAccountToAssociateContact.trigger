trigger SumofAmountvalueOnAccountToAssociateContact on Contact (after insert) {
    set<id>consetid=new set<id>();
    for(Contact con:trigger.new)
    {
        consetid.add(con.AccountId);
    }
    list<Account> updatesumaccount=[select id,Sumofaccountvalue__c,(select id,Amount__c from Contacts) from Account where Id in:consetid];
    for(account acc:updatesumaccount){
        Decimal sumamount=0;
        for(contact con:acc.contacts)//Ans-(related to contact so thats why acc.contacts)not understanding this line acc.contacts
        {
            
            sumamount = sumamount + con.Amount__c;
        }
        acc.Sumofaccountvalue__c=sumamount;
    }
    insert updatesumaccount;
        
}