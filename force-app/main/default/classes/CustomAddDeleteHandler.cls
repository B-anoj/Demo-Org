public class CustomAddDeleteHandler {
    @AuraEnabled( cacheable = true )
    public static List<Book__c> fetchBooks(String recordId) {
        return [SELECT Id, Name, Price__c FROM Book__c WHERE Id =:recordId LIMIT 100];
    }
 
    @AuraEnabled
    public static string dmlOnBooks(Object data, String removeBookIds) {
        List<Book__c> updateBook = (List<Book__c>) JSON.deserialize(JSON.serialize(data), List<Book__c>.class);
        List<Book__c> deleteBook = new List<Book__c>();
 
        if(String.isNotBlank(removeBookIds)){
            List<Id> bookIds = removeBookIds.split(',');
            deleteBook = [SELECT Id FROM Book__c WHERE Id IN :bookIds];
        }
 
        try {
            if(updateBook != null && !updateBook.isEmpty()){
                upsert updateBook;
            }
 
            if(deleteBook != null && !deleteBook.isEmpty()){    
                delete deleteBook;
            }
            return 'Success: Book__c(s) upsert/delete successfully';
        }
        catch (Exception e) {
            String errorMsg = 'The following exception has occurred: ' + e.getMessage();
            throw new AuraHandledException(ErrorMsg);
        }
       // return '';
    }
}