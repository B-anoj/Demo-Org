public class AccounttriHandler {
    public static void updaterating(list<Account>acclist)
    {
        for(account acc:acclist)
        {
            if(acc.Industry=='Media'||acc.Industry=='Energy')
            {
                acc.rating='Hot';
            }
        }
    }

}