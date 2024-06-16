trigger Accountduplicatetrg on Account (before insert) {
    if(trigger.isbefore || trigger.isInsert){
        Accountduplicatename.accountmeth(trigger.new);
    }

}