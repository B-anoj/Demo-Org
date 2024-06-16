public class wireusingmethodcls {
    @AuraEnabled(cacheable=true)
    public static list<Account> getmeth(string bname){
        return[select id,name,phone from account where name like : bname+'%'];
    }

}