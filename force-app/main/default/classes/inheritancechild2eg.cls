public class inheritancechild2eg extends Inheritancceparenteg2 {
    public static void childmeth(){
        parentmeth();
        integer a=10;
        integer b=20;
        integer c=30;
        integer sum=a+b+c;
        System.debug('sum is' +sum);
    }
}