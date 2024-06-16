public class Wiredparameter {
    @AuraEnabled(cacheable=true)
    public static list<Account> getmethod(string name){
       return[select id,name from account where name like:name]; 
    }

}