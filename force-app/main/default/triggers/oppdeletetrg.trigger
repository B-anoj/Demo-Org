trigger oppdeletetrg on Opportunity (after update) {
    if(trigger.isAfter && trigger.isUpdate){
        ContactEmailSend.oppdelete(Trigger.New);
    }
}