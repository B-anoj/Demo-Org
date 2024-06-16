public class WireBindingwithcomplexparameter {

   @AuraEnabled(cacheable=true)
     public static list<Account> getaccounts(String name){
         return [SELECT Name,id FROM account where Name like :name+'%'];
     }

}