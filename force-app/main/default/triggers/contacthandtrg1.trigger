trigger contacthandtrg1 on Contact (after update) {
    if(trigger.isbefore || trigger.isupdate){
        triggerdemo2.contactph(trigger.new);
    }

}