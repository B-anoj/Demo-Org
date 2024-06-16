trigger ContactPhoneUpdateAccPhoneUpdateTrigger on Contact (before Update) {
    if(trigger.isbefore && trigger.isUpdate){
        ContactPhoneUpdateAccPhoneUpdate.contactMethod(Trigger.New);
    }
}