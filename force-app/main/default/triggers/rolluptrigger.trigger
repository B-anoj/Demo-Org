trigger rolluptrigger on Contact (after insert) {
    if(trigger.isAfter && trigger.isinsert){
    Roolupsummaryonaccobj.rollMethod(Trigger.New);   
    }
}