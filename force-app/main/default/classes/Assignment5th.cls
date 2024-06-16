public class Assignment5th {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [SELECT Id, Name, Phone, Industry FROM Account LIMIT 10];
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {
        return [SELECT Id, FirstName, LastName, Email, Phone FROM Contact LIMIT 10];
    }

    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunities() {
        return [SELECT Id, Name, StageName, CloseDate, Amount FROM Opportunity LIMIT 10];
    }

     @AuraEnabled(cacheable=true)
    public static List<Order> getOrders() {
        return [SELECT Id, OrderNumber, EffectiveDate, Status FROM Order LIMIT 10];
    }

     @AuraEnabled(cacheable=true)
    public static List<Invoice> getInvoices() {
        return [SELECT Id,Description FROM Invoice LIMIT 10];
    }

    @AuraEnabled(cacheable=true)
    public static Account createAccount(String Name,String Phone,String Industry){
        Account acc = new Account();
        acc.Name = Name;
        acc.Phone = Phone;
        acc.Industry = Industry;
        insert acc;
        return acc;
    }
    
}