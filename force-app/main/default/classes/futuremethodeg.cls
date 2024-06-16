public class futuremethodeg {
    public static void futuremeth(){
        user useracc=[select id,firstname,lastname,username,isActive from user where 
                      username='insightssecurity@00d5g00000ip1uueaj.com'];
        
       futuremeth2(); 
    }
    @future(callout=true)
    public static void futuremeth2(){
        account acc=new account();
        acc.name='text';
        System.debug('acc');
    }

}