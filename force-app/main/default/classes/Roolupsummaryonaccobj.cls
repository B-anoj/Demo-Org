public class Roolupsummaryonaccobj {
    public static void rollMethod(list<Contact>NewList){
        set<id> lsset=new set<id>();
        
        for(Contact con:NewList){
            lsset.add(con.accountId);
        }
        
        decimal storeval=0;
        list<Account>Updateacc=[select id,name,Sumofaccountvalue__c,(select id,name,Amount__c from Contacts)
                                from Account where Id in: lsset];
         System.debug('the updated value is' +Updateacc);
        for(Account acc:Updateacc){
            for(Contact con:acc.contacts){
               storeval = storeval + con.Amount__c;
                
            }
            System.debug('the valie is' +storeval);
            acc.Sumofaccountvalue__c= storeval;
        }
        update Updateacc;
    }
}