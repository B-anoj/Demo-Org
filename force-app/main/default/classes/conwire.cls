public class conwire {
      @AuraEnabled(cacheable=true)
   public static list<contact> getconlist(){
       return [select Id,FirstName,LastName,Phone,Email from contact];
   }
   @AuraEnabled(cacheable=true)
   public static list<contact>getcont(){
       return[select FirstName,phone from contact];
   }
}