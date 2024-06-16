public with sharing class Getwirecontactrecord 
{
   @AuraEnabled(cacheable=true)
   public static list<Contact> getaccount(){
       return [select Id,FirstName,LastName,Phone from Contact];
   }
   
}