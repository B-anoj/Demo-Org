public class Soqlexampleusingmap {
    public static void mapmeth(){
        map<id,case> lsmap=new map<id,case>([select id,casenumber,status,priority,origin
                                            from case limit 1]);
        System.debug('Map record are===> '+lsmap);
        
        for(case cs:lsmap.values()){ // the map value must be declared as an sObject data type
            System.debug('MapCase record is'+cs);
        }
        
    }
    public static void listmeth(){
        list<case> lscase=new list<case>([select id,casenumber,status,priority,origin
                                            from case limit 1]);
        System.debug('list case record are===>'+lscase);
    }
    public static void deleterecord(){
        list<account> lsaccount=new list<account>([select id,name,phone from account allrows]);
        System.debug('list of account record are'+lsaccount);
        System.debug('list size is'+lsaccount.size());
    }

}