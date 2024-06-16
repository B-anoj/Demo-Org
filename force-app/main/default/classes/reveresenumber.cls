public class reveresenumber {
    public integer num=132;
    public integer rev=0;
    public integer rem=System.Math.Mod(num,10);
    public void reversemethod(){
        while(num>0){
        rem=System.Math.Mod(num,10);
        rev=rev*10+rem;
        num=num/10;
        }
        System.debug('reverse number '+rev);
    }
   
    

}