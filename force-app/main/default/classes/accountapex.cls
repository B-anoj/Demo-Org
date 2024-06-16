public class accountapex {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getcontactList(){
        return [Select Id,Name,Phone From Contact limit 15];
    }


}