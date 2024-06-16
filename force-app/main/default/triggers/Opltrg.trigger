trigger Opltrg on Opportunity (After insert) {
    if(trigger.isInsert && trigger.isAfter){
        //ContactEmailSend.opportunityLineItemInsert(Trigger.New);
    }

}