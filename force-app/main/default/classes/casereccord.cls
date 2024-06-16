public class casereccord {
    public static void casemeth(){
        list<Case> lscase =[select id,status,priority,type from case limit 10];
        for(case cs:lscase){
            System.debug('the record are:' +cs);
        }
    }

}