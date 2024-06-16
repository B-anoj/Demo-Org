trigger createAssetWhenOpLItrg on OpportunityLineItem (after Insert) {
    if(trigger.IsInsert && trigger.IsAfter){
        ContactEmailSend.createAssetWhenOpLI(Trigger.New);
    }

}