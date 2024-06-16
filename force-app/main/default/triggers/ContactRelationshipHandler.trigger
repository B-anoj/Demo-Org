trigger ContactRelationshipHandler on Contact (After Insert) {
    if(Trigger.IsInsert && Trigger.IsAfter){
        ContactRelationship.conMethod(Trigger.New);
    }

}