trigger Accountcreatedconcreated on Account (after insert) {
    list<contact> lscontact=new list<contact>();
    System.debug('list of contact is'+lscontact);
    system.debug('Trigger.new-->'+JSON.serializePretty(trigger.new));
    for(account acc: trigger.new){
        contact con=new contact();
        con.lastname=acc.name;
        con.accountid=acc.Id;
        con.phone=acc.phone;
        lscontact.add(con);
        System.debug('the conact data is'+con);
    }
    insert lscontact;
    system.debug('the account list is'+lscontact);
}