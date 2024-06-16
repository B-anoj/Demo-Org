//Create a batch class to update Account records based on related Contact information.
//Create a field on Account "Description" Long text area, Update this field as all the 
//contact's Name & Email (Format : Contact.Name - Contact.Email, Contact2.name-Contact2.Email.......).

public class Batchapexdemo5 implements Database.Batchable<sObject>{
    public DataBase.QueryLocator start(Database.BatchableContext bc){
//      return DataBase.getQueryLocator ('Select Id,Description,(Select Id,FirstName,LastName,Email from Contacts) from Account limit 5');
        return Database.getQueryLocator([
            SELECT Id, Description, (SELECT Id, FirstName, LastName, Email FROM Contacts) FROM Account WHERE Id = '0015g00001SGVSnAAP'
        ]);
    }
    public void execute(Database.BatchableContext bc, List<Account> acclist ){
        System.debug('Account ===>'+acclist);
        List<Account> accountlist = New List<Account>();
        for(Account acc : acclist){
            for(Contact con : acc.Contacts){
               acc.Description = con.FirstName + '  -  ' + con.LastName + '  -  ' + con.Email + ' , ';
            }
            System.debug('Acc---->'+acc);
            accountlist.add(acc);
            
        }
        update accountlist;
        System.debug('Update Data===>'+accountlist);
    }
    public void finish(Database.BatchableContext bc){
        System.debug('Success');
        
    }
}