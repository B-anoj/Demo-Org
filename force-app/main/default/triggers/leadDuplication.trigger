trigger leadDuplication on Lead (after insert) {
    List<Lead> leadList = new List<Lead>();
    for (Lead newLead : Trigger.new) {
        Lead clonedLead = newLead.clone(false);
        leadList.add(clonedLead);
    }
    insert leadList;
}