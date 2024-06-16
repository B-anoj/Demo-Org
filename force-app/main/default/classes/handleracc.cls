public class handleracc {
    public static void accmeth(list<Account>newlist){
        for(account acc:newlist)
        {
            if(acc.phone==null || acc.phone=='')
            {
                acc.AddError('phone field is mandatory');
            }
            else if(acc.Fax==null || acc.Fax=='')
            {
                acc.adderror('fax is mandatory');
            }
    }

}
}