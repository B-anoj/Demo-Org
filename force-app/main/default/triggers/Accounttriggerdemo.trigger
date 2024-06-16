trigger Accounttriggerdemo on Account (before insert) {
    if(trigger.isinsert && trigger.isafter){
        AccounttriggerHandlerdemo.accmeth(Trigger.new);
      }   
}