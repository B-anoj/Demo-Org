public class RefundController {

     @AuraEnabled(cacheable=true)
    public static string getProfileName() {
        System.debug('Fetching Profile Name: CS Team');
        String pr = [SELECT Id, Name FROM Profile WHERE Name = 'Customer Service Executive'].Id;
        
        System.debug(pr);
        return pr;
}

}