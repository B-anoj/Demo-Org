public class accountcontroller {
    public String accountId{get;set;}
    public Account actObj{get;set;}
    public accountcontroller(){
       actObj =new Account(); 
    }
    @AuraEnabled(cacheable=true)
    public static list<Account> getAccounts(){
        return [select id,name,phone,industry from Account limit 4];
    }
   /* @AuraEnabled
    public static list<Account> getAccountRecordList(){
        return[select id,name,phone,industry from Account limit 5];
    }*/
    public pageReference retriveAccountDetail(){
        if(accountId!=null){
            actObj = [select id,name,phone,industry from Account where id=:accountId];
        }
        return null;
    }

    
    

}