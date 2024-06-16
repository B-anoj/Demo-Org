trigger TriggerContextVariable on Account (before insert,after Insert,before update,before delete,after delete,after undelete) {
    if(trigger.isInsert && trigger.isBefore){
        TriggerContextVariableclass.BeforeInsert(Trigger.New);
    }else if(Trigger.isAfter){
        TriggerContextVariableclass.accountcrecontcrt(Trigger.New);
    }
    if(trigger.isUpdate && trigger.isBefore){
        TriggerContextVariableclass.updatePhoneDescription(Trigger.New,Trigger.oldMap);   
}
}