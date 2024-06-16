public class Arrayelement {
    public static void arrmeth(){
       /* integer[] arr= new integer[4];
        arr[0]=10;
        arr[1]=20;
        arr[2]=30;
        arr[3]=40;*/
       /* integer[] arr= new integer[]{10,20,30,40};
        System.debug(arr)*/
        
        integer[] arr= new integer[]{10,20,30,40};
        for(integer i=0;i<4;i++)
        {
            System.debug('arr is' +arr[i]);
        }
    }    
        public static void mapmeth(){
            map<Integer,string> lsmap=new map<Integer,string>();
            lsmap.put(4,'banoj');
            lsmap.put(2,'Partha');
            lsmap.put(3,'xyz');
            lsmap.put(1,'Saroj');
            lsmap.put(5,'banoj');
            System.debug('size of map is'+lsmap.size());
            System.debug(lsmap);
        }

    public static void parammeth(string aname,String stagename,Date opdate){
        list<Opportunity> opplist=new list<opportunity>();
        opportunity opp=new opportunity();
        opp.name=aname;
        opp.StageName=stagename;
        opp.CloseDate=opdate;
        opplist.add(opp);
        insert opplist;
    }
    
}