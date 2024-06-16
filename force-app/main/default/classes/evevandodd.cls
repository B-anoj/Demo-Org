public class evevandodd {
    //public integer a=3;
    //public integer r;
    public static void evenodd(integer a){
        integer r;
        r=System.Math.mod(a,2);
        if(r==0){
            System.debug('even number');
        }
        else{
            System.debug('odd number');
        }
    }
}