public class deleterecordcls {
    @AuraEnabled
    public static void deleteRecord(String recordId) {

      list<Account>lsacc=new list<Account>();
             Account accountToDelete = new Account();
             accountToDelete.Id=recordId;
             lsacc.add(accountToDelete);
            delete lsacc;
        
        
    }
}