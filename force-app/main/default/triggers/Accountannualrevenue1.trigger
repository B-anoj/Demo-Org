trigger Accountannualrevenue1 on Account (before insert) {
    if(trigger.isinsert && trigger.isbefore)
    {
        for(account acc:trigger.new)
        {
            if(acc.annualrevenue<=1000)
            {
                acc.adderror('the annual revenue more than 1000');
            }
        }
    }

}