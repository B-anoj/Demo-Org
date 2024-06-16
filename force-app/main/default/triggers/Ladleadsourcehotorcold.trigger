/* When ever Lead is created with LeadSource as Web then give rating as cold otherwise hot.*/

trigger Ladleadsourcehotorcold on Lead (before insert) {
    list<lead>listlead=new list<lead>();
    for(lead ld:trigger.new)
    {
        if(ld.LeadSource =='Web')
        {
            ld.rating='cold';
        }
        else{
            ld.rating='hot';
        }
    }
    
}