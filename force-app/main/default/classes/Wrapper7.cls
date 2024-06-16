public class Wrapper7 {   
   
    public class AccountDetailsWrapper {
        public Id accountId { get; set; }
        public String accountName { get; set; }
       
        public AccountDetailsWrapper(Id accId, String accName) {
            accountId = accId;
            accountName = accName;
        }
    }
    
    public static List<AccountDetailsWrapper> getAllAccountRecords() {
        List<AccountDetailsWrapper> accountList = new List<AccountDetailsWrapper>();
        
        List<Account> accounts = [SELECT Id, Name FROM Account];
        
        for (Account acc : accounts) {
            AccountDetailsWrapper accountWrapper = new AccountDetailsWrapper(acc.Id, acc.Name);
            accountList.add(accountWrapper);
        }
        
        return accountList;
    }
}