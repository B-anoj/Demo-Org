public class condatademo {
    @AuraEnabled(cacheable=true)
    public static list<contact> conmeth(){
        return[select id,name,fullName__c,dob__c,address__c from contact];
    }

}