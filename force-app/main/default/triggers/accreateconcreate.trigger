trigger accreateconcreate on Account (after insert) {
    list<contact>lscon=new list<contact>();
    for(account acc:trigger.new){
    contact con=new contact();
        con.lastname=acc.name;
        con.accountId=acc.Id;
        lscon.add(con);
    }
    insert lscon;
  
}