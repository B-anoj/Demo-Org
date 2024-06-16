trigger countcontri on Contact (after update) {
    if(trigger.isafter || trigger.isupdate){
        Countcontacttrigger.meth1(trigger.new);
    }

}