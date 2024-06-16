public class lightnindatatblgtrgdemo {
    @AuraEnabled
    public static list<Account> datatatbl(){
        return [select Id,Name,Phone from account limit 5];
    }

    @AuraEnabled
    public static boolean deleteRecord(Id studentId){
        Account intnRecord = [SELECT Id, Name,Phone FROM account WHERE Id =:studentId];
        delete intnRecord;
        return true;
    }
}