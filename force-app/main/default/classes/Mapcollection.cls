public class Mapcollection {
    public static void mapmeth(){
        map<integer,string> lsmap=new map<integer,string>();
        lsmap.put(1,'Rohit');
        lsmap.put(2,'Ram');
        lsmap.put(3,'Sambit');
        lsmap.put(5,'Pratik');
        lsmap.put(4,'Biswo');
        
        system.debug('the collection of record are'+lsmap); //Display the Collection Elements
        
        system.debug('the size of map is'+lsmap.size()); //Display the collection size.
        
        //Adding one map to another map
        map<integer,string> maplist=new map<integer,string>();
        maplist.put(10,'hardik');
        maplist.putall(lsmap);
        system.debug('the adding record in one map to anothe map is'+maplist);
        
        
        System.debug('the get method is'+lsmap.get(4));
        
        System.debug('the keys are ===>'+lsmap.keyset());
        
        //other processes
        set<integer> keyset1=lsmap.keyset();
        system.debug('get the set view of keys'+keyset1);
        
        system.debug('the values are===>'+lsmap.values());
        
        system.debug('the collection is empty or not====>' +lsmap.isempty());
        
        
        for(integer keyname:lsmap.keyset()) // Display the elements in seperate rows.
        {
            System.debug('the key is===>'+keyname+'the value is====>'+lsmap.get(keyname));
        }
        
        lsmap.put(6,'Mahesh');   // Adding the Elements.
        System.debug('Adding the new record in the map ===>'+lsmap);
        
        lsmap.put(6,'Niru'); // Adding Duplicate Elements..
        System.debug('after ading duplicate key,the collection size is' +lsmap.size());
        System.debug('collection element are'+lsmap);
        
        
        //map is empty or not to check
        
        if(lsmap.isempty()){
            System.debug('map is empty'+lsmap);
        }
        else{
            System.debug('map is not empty');
        }
        
        
        
        //system.dwebug('the map contains element is'+lsmap.containskey('pratik'));
        
        if(lsmap.containsKey(3))  // Check for the element contains or not..
        {
            System.debug('the element value is' +lsmap.get(3));
        }
        else{
            System.debug('value is not found');
        }
        
        
        
        //Not contains key
        if(lsmap.containsKey(8))  // Check for the element existance..
        {
            System.debug('the element value is' +lsmap.get(8));
        }
        else{
            System.debug('value is not found');
        }
        
        
        // Remove an element from the collection
        if(lsmap.containskey(5)){
            lsmap.remove(5);
            System.debug('after removing ,collection of element are'+lsmap);
            System.debug('the collection size is'+lsmap.size());
        }
        else{
            System.debug('invalid key name');
        }
        
        //Remove all element
        lsmap.clear();
        System.debug('removing all element'+lsmap);
        system.debug('the size of map is'+lsmap.size());
        
    }
    
}