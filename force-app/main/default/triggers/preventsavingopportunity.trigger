/*we have one custom object in custom picklist (open,closed) then picklist is (open)  we can edit record and picklist is 
    //(closed) we cannot edit record... how to achieved it */

trigger preventsavingopportunity on Opportunity (before insert) {
    for(Opportunity Opp:trigger.new)
    {
        opp.Status__c='Close';
        opp.adderror('we cant edit the record');
    }

}