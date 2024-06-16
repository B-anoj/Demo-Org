trigger ContactEmailSend on Contact (After Insert,Before Insert) {
    if(trigger.isAfter && trigger.isInsert){
        ContactEmailSend.emailSend(Trigger.New);
    }
    if(trigger.isBefore && trigger.isInsert){
        ContactEmailSend.preventDuplication(Trigger.New);
    }

}