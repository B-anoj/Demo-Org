trigger Oplideletetrg on OpportunityLineItem (After Delete) {
    if(trigger.isAfter && trigger.isInsert){
        ContactEmailSend.Oplidelete(Trigger.Old);
    }
}