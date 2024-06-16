trigger patientTrigger on patient__c (After insert,After delete) {

    if(trigger.isAfter && (trigger.isInsert || trigger.isUpdate)){
        patientTrigger.CountPatientOnDr(trigger.new);
    }
    
    if(trigger.isAfter && trigger.isdelete){
        patientTrigger.CountPatientOnDr(trigger.old);

    }
}