trigger Billingaddtoshippingadd on Account (before insert,before update) {
        for(Account acc:trigger.new)
    {
        acc.ShippingStreet=acc.BillingStreet;
        acc.ShippingCity=acc.BillingCity;
        acc.ShippingState=acc.BillingState;
        acc.ShippingPostalCode=acc.BillingPostalCode;
    }
}