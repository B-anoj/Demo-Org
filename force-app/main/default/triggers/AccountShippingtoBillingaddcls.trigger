trigger AccountShippingtoBillingaddcls on Account (before insert) {
    if(trigger.isBefore && trigger.isInsert){
        ContactEmailSend.AccountShippingtoBillingadd(Trigger.New);
    }

}