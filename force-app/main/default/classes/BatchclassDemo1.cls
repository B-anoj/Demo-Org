//Write a batch class to update all account Name as Account.Name + SFDC.

public class BatchclassDemo1 implements Database.Batchable<sObject>{
    
    public DataBase.QueryLocator start(Database.BatchableContext bc){
        return DataBase.getQueryLocator ('select id,Name from Account Limit 5');
    } 
    
    public void execute(Database.BatchableContext bc, List<Account> lsacc){
        List<Account> AccountList = New List<Account>(); 
       //  Account accs = new Account();
        for(Account acc : lsacc){
           
            acc.Name  =  acc.Name + 'SFDC';
            AccountList.add(acc);
            System.debug('Account update record are::'+acc);
        }
        update AccountList;
        System.debug('Account update record are::'+AccountList);
    }
    public void finish(Database.BatchableContext bc){
        System.debug('Success');
        
    }
}