trigger AccountassociatewithContact on Account (After Insert,After Update) {
    list<Contact> con=new list<Contact>();
    for(Account acc:trigger.new)
    {
        contact co=new contact();
        co.lastname='kumar' + acc.name;
        co.AccountId=acc.id;
        con.add(co);
            
    }
    insert con;
    system.debug('list of contact and account record is' +con);

}