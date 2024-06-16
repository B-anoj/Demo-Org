trigger duplicatename on Account (before insert) {
    set<string> namelsset=new set<string>();
    set<string> phonelsset=new set<string>();
    
    system.debug('Trigger.new values are =====================>'+JSON.serializePretty(trigger.new));
    
    for(Account acc:trigger.new)
    {
        namelsset.add(acc.name);
        phonelsset.add(acc.phone);
    }
    list<Account>duplicateacc=[select id,name,phone from account where name in : namelsset OR phone in : phonelsset];
    
    for(Account acc:trigger.new)
    {
        if(duplicateacc.size()>0)
        {
            acc.addError('sry!,Enter data is duplicate');
        }
    }

}