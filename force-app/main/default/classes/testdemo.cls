public class testdemo {
    
    
    public static void textdemo(){
        account acc=new account();
        acc.name='banoj';
        insert acc;

    }
    public static void textdemo(string cname){
        account acc=new account();
        acc.name=cname;
        insert acc;

    }
    public static void arrmeth(){
        integer[] arr=new integer[6];
        arr[0]=10;
        arr[1]=20;
        arr[2]=30;
        arr[3]=40;
        arr[4]=50;
        System.debug('arr is '+arr);
    }
    public static void froarrmeth(){
        integer[] age= new integer[5];
        for(integer i=0;i<=4;i++)
        {
            System.debug('age is'+age[i]);
        }
    }
    
    public static void setmet(){
        Set<String>nameSet=new Set<String>();
        nameSet.add('Banoj');
        nameSet.add('Biswa');
        nameSet.add('Sanjeeb');
        nameSet.add('Avinash');
        System.debug('nameSet'+nameSet);
        
        
        System.debug(nameSet.size());
        System.debug(nameSet.remove('Biswa'));
        //System.debug(nameSet.get('sanjeeb'));
        System.debug(nameSet.contains('rakesh'));
        
        
        
      }
    
}