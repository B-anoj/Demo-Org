/* Whenever a record is inserted to the contact automatically inserted into the account.*/

trigger ContacttoAccount on Contact (after insert,after update) {
    list<Account>lsacc=new list<Account>();
    
    for(contact con:trigger.new)    
    {
        account acc=new account();
        acc.name= con.firstname;
        acc.phone=con.phone;
        lsacc.add(acc);
    }
    
    insert lsacc;
    
}