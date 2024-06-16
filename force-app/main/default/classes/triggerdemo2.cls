public class triggerdemo2 {
    public static void metho2(list<account>Newlist){
    set<id> lsset=new set<id>();
    list<contact>lscon=new list<contact>();
    for(Account acc:Newlist){
        lsset.add(acc.id);
    }
    list<contact>updatecontact=[select id,accountid,name,phone from contact where accountid in : lsset];
    
    for(account a:Newlist)
    {
        for(contact con:updatecontact)
        {
            con.phone=a.phone;
            con.fax=a.fax;
            con.description=a.description;
            lscon.add(con);
        }
    }
    update lscon;
}
    
    
    //write a trigger when update contact phone that time account phone also update..
    
    public static void contactph(list<contact>Newlist){
        set<id> lsset=new set<id>();
        list<account>lsacc=new list<Account>();
        for(contact con:Newlist){
            lsset.add(con.accountid);
        }
        list<account>updateacc=[select id,name,phone,fax,(select id,name,phone,fax from contacts) from account where id in : lsset];
        for(contact con:Newlist)
        {
            for(account acc:updateacc)
            {
                acc.phone=con.phone;
                acc.description=con.description;
                acc.fax=con.fax;
                lsacc.add(acc);
            }
        }
        update lsacc;
    }
}