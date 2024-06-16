public class  WireBinding{

     @AuraEnabled(cacheable=true)
     public static list<Account> getaccount(){
         return [SELECT Name FROM account limit 2];
     }

}