public with sharing class NewsAppController {
    
    @AuraEnabled
    public static void retriveNews(){
       NewsApiDetails__mdt newsApiDetail = [SELECT Id,ApiKey__c,Endpoint__c FROM NewsApiDetails__mdt WHERE DeveloperName='News_App_Integration' limit 1];

        HttpRequest httpRequest= new HttpRequest();
        HttpResponse httpresp= new HttpResponse();
        
          
    }
    
}