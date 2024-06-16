trigger AccountTriggerAnnualrevenue on Account (before insert) {
    if(trigger.isbefore && trigger.isinsert)
    {
        for(account acc:trigger.new)
        if(acc.annualrevenue<=1000)
        {
            acc.adderror('the annual revenue lesstha 1000');
        }
    }

}