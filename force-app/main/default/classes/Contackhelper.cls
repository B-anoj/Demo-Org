public class Contackhelper {
    @AuraEnabled(Cacheable=true)
    public static list<contact> getcon(string sname){
        list<contact> listOfContact =  [select Id,FirstName,LastName,Email,Phone from contact 
        where name like :sname+'%' limit 10];
        return listOfContact;
    }

}