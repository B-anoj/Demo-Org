trigger AccountUpdatetrg on Account (After Update,After Insert) {
    if(trigger.IsAfter && trigger.IsInsert){
    //ContactEmailSend.AccountUpdate(Trigger.New);
      ContactEmailSend.AccountEmailSent(Trigger.new);
    }

}