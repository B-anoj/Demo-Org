public class factorial {
    public integer n=5;
    public integer fact=1;
    public void factmehod(){
        for(integer i=1; i<=n;i++){
            fact=fact*i;
            
        }
        System.debug('Factorial' +fact);
    }


}