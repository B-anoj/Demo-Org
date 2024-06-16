trigger recurrssion on Contact (after insert) {
    Set<String> accIdSet = new Set<String>(); 
    if(Recursive.isFirstTime){
        Recursive.isFirstTime = false;
        System.debug('---- Trigger run ---->'+Trigger.New.size() );
        for(Contact conObj : Trigger.New){
            if(conObj.name != 'Test') {
                accIdSet.add(conObj.accountId);
            }
        }
        // any code her
    }
}