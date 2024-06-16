public class insertcomp {
    @AuraEnabled(cacheable=true)
    public static list<Account> meth(){
        return [select id,name,phone,rating from account];
    }

}