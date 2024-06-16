public class WapperTask3 {
    public static List<Wrapperclass> CreateRecord(String accName,String conFirstName,String conLastName,String leadLastName,String leadCompany){
        list<Wrapperclass> wrp = new List<Wrapperclass>();
        Wrapperclass wp = new Wrapperclass();
        //Create Account.
        Account acc = new Account();
        acc.Name = accName;
        Insert acc;
        wp.account = acc;
        System.debug('Account record is:::'+wp.account);
        
        //Create Contact
        Contact con =new Contact();
        con.FirstName = conFirstName;
        con.LastName = conLastName;
        insert con;
        wp.contact = con;
        System.debug('Contact record is:::'+wp.contact);
       
        //Create Lead
        Lead ld = new Lead();
        ld.LastName = leadLastName;
        ld.Company = leadCompany;
        insert ld;
        wp.lead = ld;
        System.debug('Lead record is:::'+ wp.lead);
        wrp.add(wp);
        return wrp;
    }
    public class Wrapperclass{
        public Account account { get; set; }
        public Contact contact { get; set; }
        public Lead lead { get; set; }
    } 
}