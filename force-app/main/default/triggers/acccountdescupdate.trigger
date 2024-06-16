trigger acccountdescupdate on Account (after update) {
    set<id>lsset=new set<id>();
    for(account acc:trigger.new){
        lsset.add(acc.id);
    }
    list<contact>updatecondesc=[select accountid,name,account.description,account.phone from contact where accountid in : lsset];
    system.debug('list of contact record is============>'+updatecondesc);
    for(contact con:updatecondesc){
        con.description=con.account.description;
        con.phone=con.account.phone;
    }update updatecondesc;
    system.debug('update list of record are============>'+updatecondesc);
    
}