public class seraccountdata {
    @AuraEnabled(cacheable=true)
    public static list<account> meht(string searchText){
        String key='%'+searchText+'%';
        return[select id,name,phone from account where name like : key];
    }

}