public class impclass {
    @AuraEnabled
    public static list<Account> getacc(){
        return[select id,name from account];
    }

}