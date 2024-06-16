public class accoundatacol {
    @AuraEnabled(cacheable=true)
    public static list<account> getaccdata(){
        return[select Id,name from account limit 5];
    }

}