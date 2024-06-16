public class Wrapper3 {
    public static List<WrapperClass> createRecords(String accName, String conFirstName, 
                                                   String conLastName, String leadLastName,String CompanyName) {
        List<WrapperClass> wp = new List<WrapperClass>(); 
        WrapperClass wrapper = new WrapperClass();
        
        // Create Account
        Account acc = new Account();
        acc.Name = accName;
        insert acc;
        System.debug('account record' +acc);
        wrapper.account = acc;

        // Create Contact
        Contact con = new Contact();
        con.FirstName = conFirstName;
        con.LastName = conLastName;
        System.debug('contact record are :::' +con);
        //con.AccountId = acc.Id
        insert con;
        wrapper.contact = con;

        // Create Lead
        Lead lead = new Lead(LastName = leadLastName, Company = accName);
        lead.LastName = leadLastName;
        lead.Company = CompanyName;
        insert lead;
        wrapper.lead = lead;
        wp.add(wrapper);
        return wp;
    }

    public class WrapperClass {
        public Account account { get; set; }
        public Contact contact { get; set; }
        public Lead lead { get; set; }
    }


}