trigger Accountannual on Account (before insert) {
    list<Account> lsacc=trigger.new;
    for(Account acc:lsacc)
    {
        if(acc.Annualrevenue>50000)
        {
            acc.rating='hot';
                }
    }
    
}