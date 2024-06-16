trigger accountindustrybanktrg on Account (after insert) {
    if(trigger.isafter || trigger.isinsert){
        accindustrybankingcls.accmeth(trigger.new);
    }
}