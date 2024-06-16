trigger oplinsertquoteinsert on OpportunityLineItem (after insert) {
    if(trigger.isafter && trigger.isInsert){
        ContactEmailSend.oplinsertquoteinsert(Trigger.New);
    }
}