trigger Accountupdatefield on Account (before update)
{
    for(account accrecnew:trigger.new)
    {
        account accrecold=trigger.oldmap.get(accrecnew.id);
        if(accrecnew.Name!=accrecold.Name)
        {
            accrecnew.adderror('account name can not be modified/change once it created');
        }
    }

}