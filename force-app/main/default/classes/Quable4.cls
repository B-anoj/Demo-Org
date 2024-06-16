public class Quable4 implements Queueable {
    private Id accountId;
    private Integer batchSize;

    public Quable4(Id accId, Integer size) {
        this.accountId = accId;
        this.batchSize = size;
    }

    public void execute(QueueableContext context) {
        Decimal totalOpportunityAmount = 0;

        // Calculate the total Opportunity Amount for the specified Account
        List<AggregateResult> aggregateResults = [Select Sum(Amount) totalAmount From Opportunity Where AccountId = :accountId];

        if (aggregateResults != null && !aggregateResults.isEmpty()) {
            if (aggregateResults[0].get('totalAmount') != null) {
                totalOpportunityAmount = (Decimal)aggregateResults[0].get('totalAmount');
            }
        }

        // Update the Account record with the calculated total Opportunity Amount
        Account accToUpdate = [Select Id, sumoftotalopportunityamountvalue__c From Account Where Id = :accountId];

        if (accToUpdate != null) {
            accToUpdate.sumoftotalopportunityamountvalue__c = totalOpportunityAmount;
            update accToUpdate;
             System.debug('Total Opportunity Value updated for account is: ' + accToUpdate);
            System.debug('Total Opportunity Value updated for Account Id: ' + accountId);
        } else {
            System.debug('Account not found with specified Id: ' + accountId);
        }
    }
}