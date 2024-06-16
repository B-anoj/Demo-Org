trigger annualrevenue on Account (before insert) {
    handleraccount.trgmeth(trigger.new);
    
    if(trigger.isbefore && trigger.isinsert){
        handleraccount.trgmethod2(trigger.new);
    }
    }