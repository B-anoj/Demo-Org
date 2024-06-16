trigger FlowstoTriggerTask2 on Account (before insert) {
     if(trigger.isInsert && trigger.isAfter){
        FlowstoTriggercls.Metho2(Trigger.new);
    }
}