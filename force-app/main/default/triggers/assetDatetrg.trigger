trigger assetDatetrg on Asset (after Update) {
    if(trigger.isAfter &&  trigger.Isupdate){
     ContactEmailSend.assetDate(Trigger.New,Trigger.OldMap);
    }

}