trigger AccountTriggerac on Account (after insert) {
    if(trigger.isinsert && trigger.isafter){
        AccountTriggerHandeler.m1(trigger.new);
         }
}