public class accountcallparmeter {
    @AuraEnabled(cacheable=true)
 public static List<Account> getAccounts(String cname) {
   return  [SELECT Id,name,phone from Account where name like :cname+'%'];
   
 }


}