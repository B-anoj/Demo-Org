public class numberofcontactcounthandler {
    public static void countmeth(list<contact>newlist){
        set<id> lsset=new set<id>();
        
        for(contact con:newlist)
        {
            lsset.add(con.AccountId);
        }
        
        list<Account> lscontactcount=[select id,name,No_Of_Contact__c ,(select id,name from contacts)from Account where id in : lsset];
        
        for(Account acc:lscontactcount)
        {
            for(contact con:newlist)
            {
                acc.No_Of_Contact__c=acc.contacts.size();
                
            }
        }
        update lscontactcount;       
    }
    
}