public class mapdata {
    public  static void emp(){
        Map<Integer, String> myMap = new Map<Integer, String>();
        myMap.put(2, 'emp2'); 
        myMap.put(1, 'emp1'); 
        myMap.put(3, 'emp3'); 
        myMap.put(15, 'emp15');
        myMap.put(4, 'emp4');
        myMap.put(10, 'emp10');
        
        //System.debug(myMap);
        
        //System.debug('print the data according user input formated:');
        //for (Integer xyz : myMap.keySet()) {
        //  System.debug(xyz + ': ' + myMap.get(xyz));
        //}
        
        // get the highest key value in the map
        Integer maxKey = 0;
        for (Integer key : myMap.keySet()) {
            if (key > maxKey) {
                maxKey = key;
            }
        }
        System.debug('The max key value is: ' + maxKey +   ':'   +myMap.get (maxKey));
        
        //get the lowest key value in the map
        Integer minkey=null;
        for (Integer min : myMap.keySet()) {
            if (minkey == null || min< minkey) {
                minKey = min;
            }
    }
      System.debug('The min key value is: ' + minkey +   ':'     +myMap.get(minkey));
}
    
    
    public static void mapmethod(){
        Map<String, Integer> myMap = new Map<String, Integer>();
        myMap.put('a', 1);
        myMap.put('b', 2);
        myMap.put('c', 3);
        myMap.put('d', 4);
        
        String maxKey = null;
        String minKey = null;
        
        for (String key : myMap.keySet()) {
            if (maxKey == null || key > maxKey) {
                maxKey = key;
            }
            if (minKey == null || key < minKey) {
                minKey = key;
            }
        }
        
        System.debug('Max Key: ' + maxKey); 
        System.debug('Min Key: ' + minKey);
    }
    
    public static void maprec(){
        Map<Integer, String> myMap = new Map<Integer, String>();
        myMap.put(1, 'Record 1');
        myMap.put(2, 'Record 2');
        myMap.put(3, 'Record 3');
        myMap.put(4, 'Record 4');
        
        List<Integer> idList = new List<Integer>(myMap.keySet());
        
        Integer maxId = idList.isEmpty() ? null : idList[0];
        Integer minId = idList.isEmpty() ? null : idList[0];
        
        for (Integer key : idList) {
            if (key > maxId) {
                maxId = key;
            }
            if (key < minId) {
                minId = key;
            }
        }
        
        System.debug('Minimum id: ' + minId +   ':'  +myMap.get(minId));
        System.debug('Maximum id: ' + maxId +  ':'   +myMap.get(maxId));
    }
    
    
    //Easy method to do
    
    public static void mapeasy(){
        Map<Integer,String> myMap = new Map<Integer,String>();
        
        // add some key-value pairs to the map
        myMap.put(51,'key51');
        myMap.put(42,'key42');
        myMap.put(63,'key63'); 
        
        // get a list of all the keys in the map
        List<Integer> keyList = new List<Integer>(myMap.keySet());
        
        // sort the list of keys
        keyList.sort();
        
        // find the minimum and maximum keys using the first and last elements of the sorted list
        Integer minKey = keyList[0];
        Integer maxKey = keyList[keyList.size() - 1];
        
        System.debug('Minimum key: ' + minKey);
        System.debug('Maximum key: ' + maxKey);
    }
    
}