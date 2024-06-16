public class ListSetDemo {
    public static void Assignment1(){
        List<String> Lsrecord=New List<String>{'aa','bb','cc','dd','ee'};
            for(String str:Lsrecord){
                if(str=='cc')
                    Continue;
                    System.debug('the record are:'+str);
            }    
    }
    public static void Assignment2(){
        List<String> stringList = new List<String>{'aa','bb','cc','dd'};
        for(String str : stringList){
            if(str=='bb') {
                break; 
            }
            System.debug('Processing: ' + str);
            
        }
    }
    public static void Assignment3(){
        Integer i=5;
        do{
            System.debug(i);
            i++;
        }
        While(i<10);
    }
    
    Public static void Assignment4(){
        Map<String,list<String>> CountryStatecitymap = new Map<String,list<String>>();
        /*List<String> CitiesofOdisha = new list<String>{'Bhubaneswar','Cuttack','RoulKela'};
            Countrystatecitymap.put('Odisha',CitiesofOdisha);
        List<String> CitiesofKarnataka = new list<string>{'Bengaluru','Mysore','Mangalore'};
            Countrystatecitymap.put('Karnataka',CitiesofKarnataka);*/
        Countrystatecitymap.put('Odisha', new List<String>{'Bhubaneswar','Cuttack','RoulKela'});
        Countrystatecitymap.put('Karnataka', new List<String>{'Bengaluru','Mysore','Mangalore'});
        for (String state : countryStateCityMap.keySet()) {
        List<String> citiesInState = countryStateCityMap.get(state);

        System.debug('State: ' + state);
        System.debug('Cities:');
        for (String city : citiesInState) {
            System.debug(city);
        }
    }
  }
    
    Public static void Assignment5(){
        Map<Id,List<Opportunity>> ListOpportunity=new Map<Id,List<Opportunity>>();
        Set<Id> Lsset = new set<Id>();
        List<Account>ListAccount=[SELECT Id, Name FROM Account ORDER BY CreatedDate DESC LIMIT 3];
        For(Account acc:ListAccount){
            Lsset.add(acc.Id);
        }
        System.debug('List of Account record are'+lsset);
        List<Opportunity>lsopp=[Select AccountId,Name,Amount,CloseDate From Opportunity Where AccountId in : Lsset];
        System.debug('List of Opportunity record under the Account'+lsopp);
        For(Opportunity opp:lsopp){
            If(!ListOpportunity.ContainsKey(opp.AccountId)){
                ListOpportunity.put(opp.AccountId,new List<Opportunity>{opp});   
            }else{
                ListOpportunity.get(opp.AccountId).add(opp);
            }
            System.debug('the opp value are:'+opp);
        }  
        
        
        for(Id Idrec: ListOpportunity.Keyset()){
            System.debug('Id===>'+Idrec);
            System.debug('the values are'+ListOpportunity.get(Idrec));
        }
        
        System.debug('Records are:'+ListOpportunity);
    }
    
    
    public static void Assignment6(String countryName) {
    Map<String, Map<String, List<String>>> countryStateCityMap = new Map<String, Map<String, List<String>>>();

    List<String> citiesunderState = new List<String>{'Bhubaneswar', 'Cuttack', 'RoulKela'};
    
    List<String> citiesUnderUSA = new List<String>{'WasingTon Dc','Los Angeles', 'San Francisco'};
    
    Map<String, List<String>> stateCityMapIndia = new Map<String, List<String>>();
    stateCityMapIndia.put('Odisha', citiesunderState);
    countryStateCityMap.put('India', stateCityMapIndia);
    
    Map<String, List<String>> stateCityMapUSA = new Map<String, List<String>>();
    stateCityMapUSA.put('California', citiesUnderUSA);
    countryStateCityMap.put('USA', stateCityMapUSA);
    
    Map<String, List<String>> stateCityMap = countryStateCityMap.get(countryName);
    
    if (stateCityMap != null) {
        System.debug(stateCityMap);
        System.debug(countryName);
        
        Set<String> states = stateCityMap.keySet();
        for (String state : states) {
            System.debug('State: ' + state);
            System.debug('City: ' + stateCityMap.get(state));
        }
    } else {
        System.debug('Country not found');
    }
}

      
}