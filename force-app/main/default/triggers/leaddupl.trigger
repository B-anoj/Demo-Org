//. The following trigger describes when the leads are inserted into the database it would add Doctor prefixed for all lead names. 
//This is applicable for both inserting and updating the lead records.
trigger leaddupl on Lead (before insert) {
    list<lead> lslead=new list<lead>();
    for(lead ld:trigger.new){
        lead leadrec=ld.clone(false);
        lslead.add(leadrec);
    }
    insert lslead;

}