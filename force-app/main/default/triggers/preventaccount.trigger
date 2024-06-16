trigger preventaccount on Account (before delete) {
    
    if(trigger.isbefore&&trigger.isdelete){
        
        for(account acc:trigger.old){
            if(acc.Active__c=='Yes')
                acc.adderror('You are not authorized to delete the record');
        }
        
    }

}