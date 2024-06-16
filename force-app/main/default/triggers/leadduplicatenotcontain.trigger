/* Whenever a lead record is inserted into the database,
we need to check duplicate records using email and phone fields.
If duplicate content is found, then throw the error “Sorry! Entered data is duplicate”.*/

trigger leadduplicatenotcontain on Lead (before insert) {
    set<string>phonesetvar=new set<string>();
    set<string>emailsetvar=new set<string>();
    
    
    //enter data using trigger.new
    for(lead ldvar:trigger.new)
    {
        phonesetvar.add(ldvar.email);
        emailsetvar.add(ldvar.phone);
    }
    
    //query to fetch records and save into list  
    list<lead> fetchlsrec=new list<lead>();
    fetchlsrec=[select id,name,email,phone from lead where phone in :phonesetvar or email in :emailsetvar];
    for(lead ldvar:trigger.new)
    {
        if(fetchlsrec.size()>0)
        {
           ldvar.addError('Sorry! Entered data is duplicate'); 
        }
    }
}


/* other way to do  
  list<lead> fetchlsrec=new list<lead>();
    fetchlsrec=[select id,name,email,phone from lead where phone in :phonesetvar or email in :emailsetvar];
    for(lead ld:fetchlsrec)
    {
        if(fetchlsrec.size()>0)
        {
           ld.addError('Sorry! Entered data is duplicate'); 
        }
    } */