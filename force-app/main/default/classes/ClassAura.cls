public class ClassAura {
     @AuraEnabled
    public static Lead cretrecord(String recId, String FirstName, String LastName, String Company) {
      //  List<Lead> lslead = new List<Lead>();
        Lead ld = new Lead();
        ld.Id = recId;
        ld.FirstName = FirstName;
        ld.LastName = LastName;
        ld.Company = Company;
       // lslead.add(ld);
        insert ld;
        return ld;
    }
}