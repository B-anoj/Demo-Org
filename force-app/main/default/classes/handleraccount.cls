public class handleraccount {
    public static void trgmeth(list<Account>Newlist)
    {
        for(Account acc:Newlist)
        {
            if(acc.AnnualRevenue > 10000)
            {
                acc.addError('AnnualRevenue exceed more than 10000');
            }
        }
    }
    
    public static void trgmethod2(list<Account>Newlist)
    {
        for(account acc:NewList)
        {
            if(acc.Rating=='hot')
            {
            acc.name='Banoj';
            }
        }
        
    }

}