public class MapMethod {
    public static void meth(){
        map<String,String> mapofrecord = new map<string,string>();
        mapofrecord.put('America','LosAngel');
        mapofrecord.put('india','Delhi');
        System.debug(mapofrecord);
        String str = mapofrecord.get('America');
        System.debug(str);
    }

}