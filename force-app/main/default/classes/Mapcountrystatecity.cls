//When u enter the country and state name it will show the city name under the country and state.

public class Mapcountrystatecity {
    public static void citiesname(String CountryNamevalue,String StateNamevalue){
        Map<String, Map<String, list<String>>> ContainsValue =New Map<String, Map<String, List<String>>>();
         List<City__c> cities = [select Id,Name,state__r.Name,state__r.country__r.Name from City__c 
                                 where state__r.country__r.Name =: CountryNamevalue
                                 AND state__r.Name =: StateNamevalue];
        for(City__c cs:cities){
            String cityName = cs.Name;
            String stateName = cs.State__r.Name;
            String countryName = cs.State__r.Country__r.Name;

            if(!ContainsValue.ContainsKey(countryName)){
                ContainsValue.put(countryName, New Map<String, List<String>>());
            }
            Map<String,List<String>> StatecityMap = ContainsValue.get(countryName);
            
            if(!StatecityMap.containsKey(stateName)){
                StatecityMap.put(stateName, New List<String>());
            }
            list<String> CitiesName =StatecityMap.get(stateName);
            CitiesName.add(cityName);  
        }
        if(ContainsValue.containsKey(CountryNamevalue)){
            Map<String,List<String>> StatecityMap = ContainsValue.get(CountryNamevalue);
        
            if(StatecityMap.containsKey(StateNamevalue)){
                List<String> CitiesName = StatecityMap.get(StateNamevalue);
                
                System.debug('Cities are belongs under::: ' + CountryNamevalue + ', ' + StateNamevalue);
                for(String cityName : CitiesName){
                     System.debug('City: ' + cityName);
                }
            } 
            else {
                System.debug('No cities found for the given state in the country.');
            }
        }       
    }
    
    
 //When you enter the country name ,It will show the State name and state name under the Country.
    
    public static void citiesname(String CountryNamevalue) {
        Map<String, Map<String, List<String>>> ContainsValue = new Map<String, Map<String, List<String>>>();
        
        List<City__c> cities = [SELECT Id, Name, State__r.Name, State__r.Country__r.Name FROM City__c 
                                 WHERE State__r.Country__r.Name = :CountryNamevalue];
        
        for (City__c cs : cities) {
            String cityName = cs.Name;
            String stateName = cs.State__r.Name;
            String countryName = cs.State__r.Country__r.Name;

            if (!ContainsValue.containsKey(countryName)) {
                ContainsValue.put(countryName, new Map<String, List<String>>());
            }
            
            Map<String, List<String>> stateCityMap = ContainsValue.get(countryName);
            
            if (!stateCityMap.containsKey(stateName)) {
                stateCityMap.put(stateName, new List<String>());
            }
            
            List<String> citiesName = stateCityMap.get(stateName);
            citiesName.add(cityName);  
        }
        
        if (ContainsValue.containsKey(CountryNamevalue)) {
            Map<String, List<String>> stateCityMap = ContainsValue.get(CountryNamevalue);
            
            for (String state : stateCityMap.keySet()) {
                List<String> citiesName = stateCityMap.get(state);
                
                System.debug('Cities under: ' + CountryNamevalue + ', ' + state);
                for (String cityName : citiesName) {
                    System.debug('City: ' + cityName);
                }
            }
        } else {
            System.debug('No cities found for the given country.');
        }
    }
}