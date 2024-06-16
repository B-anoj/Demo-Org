trigger accbillingcityupdatetocontrg on Account (After Update) {
    if(trigger.IsAfter && trigger.IsUpdate){
        ContactEmailSend.accbillingcityupdatetocon(Trigger.New);
    }

}