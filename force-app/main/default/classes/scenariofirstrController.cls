public with sharing class scenariofirstrController {
    @AuraEnabled
    public static Lead cretrecord(String recId, String FirstName, String LastName, String Company, String Email, String Phone) {
      //  List<Lead> lslead = new List<Lead>();
        Lead ld = new Lead();
        ld.Id = recId;
        ld.FirstName = FirstName;
        ld.LastName = LastName;
        ld.Company = Company;
        ld.Email = Email;
        ld.Phone = Phone;
       // lslead.add(ld);
        insert ld;
        return ld;
    }
}