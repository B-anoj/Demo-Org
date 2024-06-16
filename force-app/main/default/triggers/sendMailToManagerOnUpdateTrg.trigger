trigger sendMailToManagerOnUpdateTrg on User ( After Update) {
    if(Trigger.isAfter && trigger.isUpdate){
        ContactEmailSend.sendMailToManagerOnUpdate(Trigger.New);
    }
}