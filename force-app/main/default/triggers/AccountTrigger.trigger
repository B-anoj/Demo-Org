///while user creating an account,if user provides billing address but not shipping address, write logic populated shipping address with billing address.
trigger AccountTrigger on Account (before insert) {
    
    //context variables(Values which developer need to write logic)
    //context variable1:trigger.new-->list of record got inserted
    //context variable2:trigger.before-->returns true if trigger is running on before event
    //context variable2:trigger.insert-->returns true if trigger is called when user has done insert operation
    if(trigger.isbefore && trigger.isinsert){
        
        For(Account acc:trigger.new)
        {
            if(acc.shippingstreet==null)
            {
                acc.shippingstreet=acc.billingstreet;
            }
            if(acc.shippingcity==null)
            {
                acc.shippingcity=acc.billingcity;
            }
            if(acc.shippingstate==null)
            {
                acc.shippingstate=acc.billingstate;
            }
        }
    }
    
}