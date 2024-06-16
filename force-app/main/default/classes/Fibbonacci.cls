public class Fibbonacci {
    public integer n1=0;
    public integer n2=1;
    public integer n3;
    public integer n=10;
    public void fibbomethod(){
        System.debug(n1);
        System.debug(n2);
        for(integer i=2;i<=n;i++){
            n3=n1+n2;
            n1=n2;
            n2=n3;
        }
        System.debug(n3);
    }
}