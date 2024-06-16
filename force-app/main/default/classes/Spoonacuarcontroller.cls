public class Spoonacuarcontroller {
    public static void getRecipe(){
        Spoonnacular__mdt spoon=[SELECT ID,Endpoint_API__c,API_Key__c FROM Spoonnacular__mdt where 
                                DeveloperName='Spoonnacular_Data'];
    
    HttpRequest req = new HttpRequest();
   // req.setEndpoint(endPoint) ;   
    req.setEndpoint(spoon.Endpoint_API__c);
    req.setHeader('x-api-key', spoon.API_Key__c);
    req.setMethod('GET');
    
    Http ht = new Http();
        
    HttpResponse response = ht.send(req);  
        
        if(response.getStatusCode()==2000){
            System.debug('===data==>'+response.getBody());
        }
    }

}