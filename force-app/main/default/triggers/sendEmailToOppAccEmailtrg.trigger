trigger sendEmailToOppAccEmailtrg on OpportunityLineItem (After insert) {
    if(Trigger.IsInsert && trigger.IsAfter){
    ContactEmailSend.sendEmailToOppAccEmail(Trigger.New);
    }
   /*  if(Trigger.IsInsert && Trigger.Isafter){
        ContactEmailSend.createAsset(Trigger.New);
} */
}