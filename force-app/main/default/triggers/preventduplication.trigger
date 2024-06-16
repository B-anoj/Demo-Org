trigger preventduplication on Account (before insert,before update) {
    if(Trigger.isInsert && Trigger.isBefore)
    {
        set<string> lsstr=new set<string>();
        set<string> phlstr=new set<string>();
        
        system.debug('Trigger.new-->'+JSON.serializePretty(trigger.new));
        
        for(account acc:trigger.new)
        {
            lsstr.add(acc.name);
            phlstr.add(acc.phone);
        }
        list<account> updateacc=[select id,name,phone from account where name in : lsstr and phone in : phlstr];
        System.debug('updated account list are ==================>'+updateacc);
        for(account acc:trigger.new){
            if(updateacc.size() > 0)
            {
                acc.adderror('the name is already exit');
                acc.adderror('the phone already exist');
            }
        }
    }
    
}