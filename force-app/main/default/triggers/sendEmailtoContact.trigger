trigger sendEmailtoContact on Account (After update) {
    if(trigger.isUpdate && trigger.isAfter){
        ContactEmailSend.sendEmailtoContact(Trigger.New,Trigger.OldMap);
    }
}