public class MapofCountrystatedependentpicklist {
    @AuraEnabled(cacheable=true)
    public static Map<String, List<String>> fetchDependentPicklistValues() {
        Map<String, List<String>> countryStateMap = new Map<String, List<String>>();

        for (AggregateResult agg : [SELECT State__c, Country__c FROM Account WHERE State__c != null AND Country__c != null GROUP BY State__c, Country__c]) {
            String state = String.valueOf(agg.get('State__c'));
            String country = String.valueOf(agg.get('Country__c'));

            if (countryStateMap.containsKey(state)) {
                countryStateMap.get(state).add(country);
            } else {
                countryStateMap.put(state, new List<String>{country});
            }
        }
         System.debug('countryStateMap=========>'+countryStateMap);
        return countryStateMap;
       
    }
}