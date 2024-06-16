//. The following trigger describes when the leads are inserted into the database it would add Doctor prefixed for all lead names. 
//This is applicable for both inserting and updating the lead records.
trigger LeadInsertUpdate on Lead (before insert,before update) {
     list<lead>lslead=new list<lead>();
    if(trigger.isInsert && trigger.isBefore)
    for(lead ld:Trigger.new){
        ld.LastName= 'Dr' +ld.LastName;
        lslead.add(ld);
    }
    update lslead;
  /* else if(trigger.isUpdate && trigger.isBefore){
        list<lead>lslead=new list<lead>();
        for(Lead ld:Trigger.new){
            lslead.add(ld);
        }
        update lslead;
    }*/
    
}