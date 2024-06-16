trigger acctopptrg on Account (after insert) {
    if(trigger.isafter || trigger.isInsert){
        Whenacccrtoppcrt.oppcrtmeth(trigger.new);
    }
    
}