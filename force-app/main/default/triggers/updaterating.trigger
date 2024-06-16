trigger updaterating on Account (before insert) {
    
   /* if(trigger.isbefore&&trigger.isinsert){
    
    account1helper.ratingupdate(trigger.new);
    }

   
    
    if(trigger.isafter&&trigger.isinsert){
        account1helper.createcontact(trigger.new);
    }*/
account1helper.callaccount();
}