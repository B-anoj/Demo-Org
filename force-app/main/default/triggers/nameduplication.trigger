trigger nameduplication on Opportunity (before insert,before update) {
    list<string>lsopp=new list<string>();
    for(opportunity opp:trigger.new)
    {
        lsopp.add(opp.name);
    }
    list<opportunity> updateopp=[select id,name from opportunity where name in :lsopp];
    for(opportunity opp:trigger.new)
    {
         if(updateopp.size()>0)
         {
             opp.AddError('the name is alreay exit');
         }
    }
}