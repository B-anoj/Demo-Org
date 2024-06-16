public class OrderSubOrderSubOrdLineItem {
    
    public static void orderSubOrderSubOrdLineItemMeth(String ordId) {
        try {
            // List to hold SubOrder__c records
            List<SubOrder__c> orderId = new List<SubOrder__c>();
           
            // Set to hold SubOrder__c Ids
            Set<Id> suborderId = new Set<Id>();
            Map<Id,SubOrder__c > subOrderNameMap = new Map<Id,SubOrder__c>();
            System.debug('ordId======>'+ordId);
            if(ordId != null){
                System.debug('ordId======>'+ordId);
                // Query to fetch SubOrder__c records based on Order1__c
                orderId = [SELECT Id, Order1__c,Name FROM SubOrder__c WHERE Order1__c = :ordId];
                
                System.debug('orderId=====>'+orderId);
            }
            // Loop to add the Id of each SubOrder__c record to the set
           for (SubOrder__c sub : orderId) {
               System.debug('sub.Id=========>'+sub.Id);
                suborderId.add(sub.Id);
                
                subOrderNameMap.put(sub.Id,sub);
              
                
                // Optionally, you can add the Name to a separate collection or use a Map
            }
             //System.debug('sub.Id=========>'+sub.Id);
            System.debug('suborderId=========>'+suborderId);
            System.debug('subOrderNameMap=========>' + subOrderNameMap);   
            
            List<SubOrderLineItem__c> suborderLineItem = new List<SubOrderLineItem__c>();
            Map<Id,List<SubOrderLineItem__c>> MapofSuborder = new Map<Id,List<SubOrderLineItem__c>>();
            
            suborderLineItem = [Select Id,SubOrder__c,Name from SubOrderLineItem__c Where SubOrder__c IN : suborderId];
            System.debug('suborderLineItem=======>'+suborderLineItem);
            for(SubOrderLineItem__c sbli :suborderLineItem){
                if(!MapofSuborder.containsKey(sbli.SubOrder__c)){
                MapofSuborder.put(sbli.SubOrder__c, new List<SubOrderLineItem__c>());
            } 
           MapofSuborder.get(sbli.SubOrder__c).add(sbli);
        }
        }catch (Exception e) {
            // Handle the exception appropriately, such as logging it
            System.debug('An error occurred: ' + e.getMessage() + 'An error occurred LineNumber: ' + e.getLineNumber());
        }
    }
}