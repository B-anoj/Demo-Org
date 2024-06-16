trigger ProductQuantitytrigger on OpportunityLineItem (after insert,after Update) {
    if(trigger.isafter && trigger.isupdate){
        ContactEmailSend.ProductQuantity(Trigger.New);
    }

}