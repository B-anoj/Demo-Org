trigger demoacccretconcrt on Account (after insert) {
    list<contact>lscon=new list<contact>();
    if(trigger.isafter || trigger.isinsert){
        for(Account acc:trigger.new)
        {
            contact con=new contact();
            con.lastname=acc.name;
            con.phone=acc.phone;
            con.accountId=acc.id;
            lscon.add(con);
            System.debug('the conact data is'+con);   
        }
    }
    insert lscon;
    system.debug('the account list is'+lscon);
}