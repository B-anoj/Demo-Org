public class WrapperTask5 {
    
    public static List<AccountDetailWrapper> AccoutDetailMethod(List<Id>AccIds){
        List<AccountDetailWrapper> WrapperList = new List<AccountDetailWrapper>();
        
        List<Account> AccountlIst = [Select Id,Name,Industry from Account where Id In : AccIds];
        
        for(Account acc : AccountlIst){
            AccountDetailWrapper accounts = new  AccountDetailWrapper();
            accounts.accountId = acc.Id;
            accounts.accountName = acc.Name;
            accounts.industry = acc.industry;
            WrapperList.add(accounts);
        }
        return WrapperList;
    }
    
    public class AccountDetailWrapper{
        public Id accountId { get; set; }
        public String accountName { get; set; }
        public String industry { get; set; }
        public String phone { get; set; }
        public String website { get; set; }
    }

}