trigger FlowstoTrigger on Contact (After update) {
    if(trigger.isAfter && trigger.isUpdate){
       // FlowstoTriggercls.Meth1(Trigger.New);
        FlowstoTriggercls.Mapmeth(Trigger.New,Trigger.OldMap);
        
    }
}