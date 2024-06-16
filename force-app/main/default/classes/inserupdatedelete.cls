public class inserupdatedelete {
    public static void inserUpdateDeleteMethod(){
        Account acc=new Account(name='Panther');
        insert acc;
        System.debug(acc);
// Once the account is inserted, the sObject will be 
// populated with an ID.
// Get this ID.
         Id conid=acc.id;
        System.debug(conid);
// Add a contact to this account.
        Contact con=new Contact(Firstname='lucifier',lastname='jack',
                               phone='56789754789',AccountId=conid);
        insert con;
        system.debug(con);
        contact queriedcon=[select Account.name from contact where firstname='lucifier' 
                            AND lastname='jack' limit 1];
         //Update the contact's phone number
        queriedcon.phone='637288991';
        system.debug(queriedcon);
        // Update the related account industry
        queriedcon.Account.Industry='technology';
        // Make two separate calls 
        // 1. This call is to update the contact's phone.
        update queriedcon;
        System.debug(queriedcon);
        // 2. This call is to update the related account's Industry field.
        update queriedcon.Account;
        system.debug(queriedcon.Account);  
    }

}