trigger accountcrecontcls on Account (after insert) {
    if(trigger.isafter || trigger.isinsert){
        Accountcreconcrt.acccrtmeth(trigger.new);
    }

}