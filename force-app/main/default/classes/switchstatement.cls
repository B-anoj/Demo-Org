public class switchstatement {
    public static void mehtswitch(){
        integer dayofweek=2;
        //string dayname;
        switch on(dayofweek){
            when 1{
                system.debug('Sunday');
            }
            when 2{
                system.debug('monday');
            }
            
            
            when else{
                system.debug('Invalid');
            }
           
            
        }
    }
    
    public static void method2(){
        integer i=1;
        while(i<100)
        {
            System.debug(i);
            i++;
        }
    }
    
    public static void dowhilemeth(){
        integer i=1;
        do{
            i=i+1;
            System.debug(i);
        }
        while(i<0);
    }
    
    public static void formeth(){
        for(integer i=0;i<100;i=i+2)
        {
           System.debug('even number only'+i); 
        }
    }
     public static void formeth1(){
        for(integer i=0;i<5;i--)
        {
           System.debug('values are'+i); 
        }
    }
}