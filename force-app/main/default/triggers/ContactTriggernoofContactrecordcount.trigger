trigger ContactTriggernoofContactrecordcount on Contact (after insert,after delete,after update) {
    if(trigger.isafter && trigger.isdelete)
        list<contact>NewList=trigger.new;
    list<contact>OldList= trigger.old;
    
    if( trigger.isafter &&(trigger.isinsert|| trigger.isupdate)){
        set<id>consetid=new set<id>();
        for(contact con:trigger.new)
        {
            consetid.add(con.AccountId);
        }
        list<Account> accountrelatedcontact=[select id, No_Of_Contact__c,(select id from Contacts) from Account where id IN:consetid];
        for(Account acc:accountrelatedcontact)
        {
            acc.No_Of_Contact__c=acc.Contacts.size();
        }
        update accountrelatedcontact; 
    }    
    if( trigger.isafter &&(trigger.isdelete)){
        set<id>consetid=new set<id>();
        for(contact con:trigger.old)
        {
            consetid.add(con.AccountId);
        }
        list<Account> accountrelatedcontact=[select id, No_Of_Contact__c,(select id from Contacts) from Account where id IN:consetid];
        for(Account acc:accountrelatedcontact)
        {
            acc.No_Of_Contact__c=acc.Contacts.size();
        }
        update accountrelatedcontact; 
    } 
    if(trigger.isinsert && trigger.isafter){
        recursiontrigger.recursive(trigger.new);
    }
}