public class SearchPricebookEntryHandler {
    @AuraEnabled
    public static List<PricebookEntry> getPricebookEntry(String pname){
        return [
            SELECT Id,Product2Id, Product2.Name, Product2.ProductCode, ProductCode
            FROM PricebookEntry 
            WHERE Product2.Name LIKE :pname + '%'
        ];
    }

    @AuraEnabled
    public static List<PricebookEntry> getPricebookEntryDefault(){
        return [SELECT Id, Product2.Name, Product2.ProductCode, UnitPrice,Name,ProductCode FROM PricebookEntry];
    }

@AuraEnabled
public static void createOpportunityLineItem(List<opportunityLineItem>pbentrylist) {
    List<OpportunityLineItem> oppLineItem = new List<OpportunityLineItem>();

    /* for (OpportunityLineItemInput input : pbentrylist) {
        OpportunityLineItem oppLineItem = new OpportunityLineItem();
        oppLineItem.OpportunityId = input.opportunityId;
        oppLineItem.Product2Id = input.product2Id;
        oppLineItem.TotalPrice = input.totalPrice;
        oppLineItem.Quantity = input.quantity;
        oppLineItems.add(oppLineItem);
    }*/

    if (!pbentrylist.isEmpty()) {
        insert pbentrylist;
    }
}

}