trigger assertisInserttrg on Asset (After insert) {
    if(Trigger.isInsert && trigger.isAfter){
        ContactEmailSend.assertisInsert(Trigger.New);
    }
}