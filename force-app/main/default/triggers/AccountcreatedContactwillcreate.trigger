trigger AccountcreatedContactwillcreate on Account (After insert) {
    if(trigger.isinsert && trigger.isafter)
    {
        list<Account>conlist=new list<Account>();
        for(account acc:trigger.new){
            Account con=new Account();
            con.name=acc.name;
          //  con.accountid=acc.id;
            conlist.add(con);
        }
    insert conlist;
    
}
}