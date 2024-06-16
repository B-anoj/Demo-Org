public class UpdateRecordTask5handler {
    @AuraEnabled
    public static Case updateCase(String caseId, String caseSubject, String caseDescription, String caseStatus) {
        System.debug('caseId ===>'+caseId);
        System.debug('caseSubject===>'+caseSubject);
        System.debug('caseDescription===>'+caseDescription);
        System.debug('caseStatus===>'+caseStatus);
        
        
       // Case cse = [SELECT Id, Subject, Description, Status FROM Case WHERE Id = :caseId LIMIT 1];

       // if (cse != null) {
           Case cse = new Case();
           cse.id = caseId;
            cse.Subject = caseSubject;
            cse.Description = caseDescription;
            cse.Status = caseStatus;
            update cse;
            System.debug('cse====>'+cse);
            return cse;
        }
}



// public class UpdateRecordTask5handler {

//     @AuraEnabled
//     public static List<Case> updateCase(String accountId, String caseSubject, String caseDescription, String caseStatus) {
//         List<Case> updatedCases = new List<Case>();

//         // Query for the case to update
//         Case caseToUpdate = [SELECT Id, Subject, Description, Status FROM Case WHERE Id = :accountId LIMIT 1];

//         if (caseToUpdate != null) {
//             // Update the case with the provided information
//             caseToUpdate.Subject = caseSubject;
//             caseToUpdate.Description = caseDescription;
//             caseToUpdate.Status = caseStatus;

//             // Update the case in the database
//             update caseToUpdate;

//             // Add the updated case to the list
//             updatedCases.add(caseToUpdate);
//         }

//         return updatedCases;
//     }
// }