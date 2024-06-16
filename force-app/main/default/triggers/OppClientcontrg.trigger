trigger OppClientcontrg on Opportunity (After Insert, after update,before update) {
    /*if(trigger.isafter && trigger.isupdate){
        ContactEmailSend.OppClientcon(Trigger.New);
    } */
     /*if(trigger.isafter && trigger.isUpdate){
        ContactEmailSend.Multipickval(Trigger.New);
    }*/
    if(trigger.isbefore && trigger.isUpdate){
        ContactEmailSend.selectmultipickvalue(Trigger.New,Trigger.OldMap);
    }

}