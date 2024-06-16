public class contactalldata {
    @AuraEnabled(cacheable=true)
    public static list<Contact> getcontactbyaccountid(string accountId){
        return[select Id,FirstName,LastName,Email,Phone from Contact where AccountID=:accountId limit 5];
    }
    

}