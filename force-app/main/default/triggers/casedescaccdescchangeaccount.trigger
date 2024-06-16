trigger casedescaccdescchangeaccount on Case (after update) {
    set<id> acclsset=new set<id>();
    set<id> conlsset=new set<id>();
    
    system.debug('Trigger.new-->'+JSON.serializePretty(trigger.new));
    
    for(case cs: trigger.new)
    {
        acclsset.add(cs.AccountId);
        conlsset.add(cs.ContactId);
            }
    list<account> updateacccase=[select name,description from account where Id in : acclsset];
    System.debug('account list--->'+updateacccase);
    list<contact> updateconcase=[select name from contact where Id in : conlsset];
    System.debug('contact list--->'+updateconcase);
    for(account acc : updateacccase)
    {
        system.debug(acc.Description);
        for(case cs:trigger.new)
        {
            acc.description=cs.description;
        }
    }
    for(contact con:updateconcase)
    {
        for(case cs: trigger.new)
        {
            con.Description=cs.Description;
        }
    }
    update updateacccase;
    update updateconcase;                           
}