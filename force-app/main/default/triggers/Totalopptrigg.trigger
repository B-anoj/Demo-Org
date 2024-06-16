trigger Totalopptrigg on Account (before update,After Update) {
    if(trigger.isBefore && trigger.isUpdate){
        ContactEmailSend.Totalopp(Trigger.New);
    }
}