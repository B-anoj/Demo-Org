trigger SystemAdmindeleteTask on Task (before delete) {
    if(trigger.isBefore && trigger.isDelete){
        ContactEmailSend.SystemAdimindlteTask(Trigger.old);
    }

}