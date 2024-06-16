trigger doctorTrigger on Doctor__c (After insert,After delete) {

    
        if(trigger.isAfter && (trigger.isInsert || trigger.isUpdate)){
        patientTrigger.DoctorCount(trigger.new);
    }
    
    if(trigger.isAfter && trigger.isdelete){
        patientTrigger.DoctorCount(trigger.old);

    }
}