public class Soqleg1 {
    public static void soqlmeth(){
        list<Account> acc=[SELECT id,name,phone,CreatedById, 
                                            createdDate from account order by createdDate Desc limit 2];
        for(Account ac:acc)
        {
            System.debug('the id is '+ac.id);
            System.debug('the name is'+ac.name);
        }
        
    }
    public static void soqlmeth2(string cname){
        list <Account> acc=[select id,name,phone from 
                            account where name =: cname order by name];
        for(Account ac:acc){
            System.debug('account id is'+ac.id);
            System.debug('account name is'+ac.name);
            System.debug('the record are'+ac);
        }
    }
    public static void sqlmeth3(String IndustryName){
        map<id,Account> lsmap=new map<id,Account>([select id,name,phone,Industry
                                                  from account where industry =:IndustryName]);
        System.debug('The collection size is'+lsmap.size());
        
        // Get the Related Contacts of the Accounts.
        list<Contact> lscontact=[select id,firstname,lastname,phone 
                                from contact where accountid =: lsmap.keyset()];
        System.debug('The related contact  size is'+lscontact.size());
        System.debug('the record are'+lscontact);
        
    }

}