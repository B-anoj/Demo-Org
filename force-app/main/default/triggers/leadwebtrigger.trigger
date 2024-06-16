trigger leadwebtrigger on Lead (before insert) {
    if(trigger.isbefore || trigger.isinsert){
        leadwebclass.LeadMeth(trigger.new);
    }

}