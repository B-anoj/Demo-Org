trigger TR3010eg5MobileValidation on patient__c (before insert) {
    list<patient__c> lspat=trigger.new;
    for(patient__c pa:lspat)
    {
        if(pa.Phone_number__c!=null || pa.Phone_number__c !='')
        {
            if(pa.Phone_number__c.isnumeric()==true)
            {
                if(pa.Phone_number__c.length()==10)
                {
                    if(pa.Phone_number__c.left(1)<> '9' && pa.Phone_number__c.left(1)<> '8')
                    {
                            pa.Phone_number__c='99999999';     
                    }
                }
                else{
                       pa.Phone_number__c='9999999998';
                }
            }
            else{
                   pa.Phone_number__c='9999999997';
            }
        }
    }
    
}