public class deleterecacc {
    @AuraEnabled(cacheable=true)
    public static list<Account> getacc(){
        return[select id,name from account limit 20];

    }

}