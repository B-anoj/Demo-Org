trigger accountphonefaxmandatory on Account (before insert) {
    if(trigger.isinsert && trigger.isbefore){
        for(account acc:trigger.new)
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