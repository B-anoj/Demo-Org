trigger TR_3011_eg2_Patient on patient__c (before insert) {
    list<patient__c> lspai=trigger.new;
    for(patient__c pa:lspai)
    {
        pa.RegistrationFees__c = pa.RegistrationFees__c * 1.1;
    }
}