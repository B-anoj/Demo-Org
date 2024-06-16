public class accountcallparmet {
    @AuraEnabled(cacheable=true)
 public static List<Account> getAccounts(String name) {
   return  [SELECT Id,name,phone,industry,annualrevenue  from Account where name like :name+'%'];
   
 }


}