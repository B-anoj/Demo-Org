public class Mapeg1{
    public static void mapmeth(){
        map<string,list<integer>> maplist = new map<string,list<integer>>();
        maplist.put('Sanjeeb',new list<integer>{76,55,57});// Adding the Elements...
        maplist.put('Banoj',new list<integer>{34,56,23});// Adding the Elements...
        maplist.put('Saroj',new list<integer>{34,56,23});// Adding the Elements...
        maplist.put('Sanjeeb',new list<integer>{89,65,74});// Adding duplicake key...
        maplist.put('partha',new list<integer>{78,25,45});// Adding the Elements...
        system.debug('size of map is'+maplist.size());
        
        System.debug('Map list are'+maplist);
        System.debug('Key is'+maplist.get('Sanjeeb'));// This method is used to get the value of the Specified Key.
        System.debug('Set value are'+maplist.keyset());// Display the Keys Collection.
        System.debug('value are'+maplist.values());// Display the Values.
       // System.debug('value are'+maplist.remove(Sanjeeb));
        
    }
}