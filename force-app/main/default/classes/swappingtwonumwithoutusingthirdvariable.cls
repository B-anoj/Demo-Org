public class swappingtwonumwithoutusingthirdvariable {
    integer a=10;
    integer b=20;
    public void swappingmethod(){
        system.debug('before swapping of'+ a +' '+b);
        a=a+b;
        b=a-b;
        a=a-b;
        system.debug('after swapping of'+ a +' '+b);
        
    }

}