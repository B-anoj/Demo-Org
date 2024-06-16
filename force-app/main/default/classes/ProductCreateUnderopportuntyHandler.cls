public class ProductCreateUnderopportuntyHandler {
    @AuraEnabled(cacheable=true)
    public static void createOpportunityLineItems(Id opportunityId, List<String> productIds, List<Integer> quantities) {
        List<OpportunityLineItem> oppLineItems = new List<OpportunityLineItem>();

        for (Integer i = 0; i < productIds.size(); i++) {
            String productId = productIds[i];
            Integer quantity = quantities[i];

            OpportunityLineItem oli = new OpportunityLineItem();
                oli.OpportunityId = opportunityId;
                oli.PricebookEntryId = null;
                oli.Quantity = quantity;
                oli.Product2Id = productId;
            oppLineItems.add(oli);
        }

        if (!oppLineItems.isEmpty()) {
            insert oppLineItems;
        }
}
}