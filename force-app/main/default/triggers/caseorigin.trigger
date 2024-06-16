//.When ever a case is created with origin as email then set status as new and Priority as Medium.
trigger caseorigin on Case (before insert) {
    if(trigger.isbefore || trigger.isinsert){
            caseoriginclass.casemethod(trigger.new);
        }

}