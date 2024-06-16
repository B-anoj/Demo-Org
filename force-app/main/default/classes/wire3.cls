public class wire3 {
     @AuraEnabled(cacheable=true)
    public static list<contact> getmethod(){
         return [SELECT Name FROM contact limit 10];

    }
}