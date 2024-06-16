/*.Write a trigger that will set the Site Status field to “On Air” if the In Service A date has a value.*/

trigger projecttosite on project__c (after insert,after update,after delete) {
    set<id> sitesetid=new set<id>();
    
    //insert new trigger
   
    for(project__c pro:trigger.new)
    {
        if(pro.In_Service_A__c !=null)
                {
                     sitesetid.add(pro.site__c);
                }   
    }
    //for delete operation
    
    if(trigger.isdelete)
    {
        for(project__c pro:trigger.old)
        {
            sitesetid.add(pro.site__c);
        }
    }
    //fetch the project record into site the object.
 
    list<site__c> lssite=[select id,sitestatus__c,Numberoffield__c,(select id from Projects__r)from site__c where ID in: sitesetid];
        for(site__c si:lssite)
        {
            
            si.Numberoffield__c=si.Projects__r.size();
            si.sitestatus__c='OnAir';
        }
    update lssite; 
}