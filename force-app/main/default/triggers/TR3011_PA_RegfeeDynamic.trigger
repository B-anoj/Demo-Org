trigger TR3011_PA_RegfeeDynamic on Patient2__c (before insert,before update) {
    list<Patient2__c> npl=Trigger.new;

}