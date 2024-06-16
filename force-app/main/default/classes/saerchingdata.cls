public class saerchingdata {
    @AuraEnabled(cacheable=true)
    public static list<Account> getdata(string cname){
        return[select id,name from account where name like:cname];
    }

}