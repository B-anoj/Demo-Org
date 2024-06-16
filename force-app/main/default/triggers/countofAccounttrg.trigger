trigger countofAccounttrg on Account (after insert,After Delete) {
   // if(trigger.isInsert && trigger.Isafter){
    if(trigger.isAfter && trigger.isDelete){
    ContactEmailSend.countofAccount(Trigger.new,Trigger.old);
    }
}