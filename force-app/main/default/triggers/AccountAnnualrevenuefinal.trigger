/*Create a Trigger on Account Object, To assign the Annualrevenue value as below..
Industry Name Annualrevenue
----------------------------------------------------------------
Banking ----> 5000000
Finance ----> 4000000
Insurance ----> 3500000
Healthcare ----> 2500000
Else ----> 500000*/

trigger AccountAnnualrevenuefinal on Account (before insert,before update) {
    for(Account acc:trigger.new)
    {
        if(acc.industry=='banking')
        {
            acc.AnnualRevenue=50;
        }
        else if(acc.industry=='finance')
        {
            acc.AnnualRevenue=40;
        }
        else if(acc.industry=='insurance')
        {
            acc.AnnualRevenue=30;
        }
        else
        {
            acc.AnnualRevenue=10;
        }
    }

}