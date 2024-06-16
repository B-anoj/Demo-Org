trigger TR3011eg3GSTcal on patient__c (before insert) {
    list<patient__c> lspai=trigger.new;
    cls3011GST.GST(lspai);
}