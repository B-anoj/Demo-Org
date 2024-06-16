public class pallindrom {
    integer n=132;
    integer rev=0;
    integer rem=System.Math.mod(n,10);
    public void pallindrommethod(){
        integer temp=n;
        while(n>0)
        {
            rem=System.Math.Mod(n,10);
            rev=rev*10+rem;
            n=n/10;
        }
        if(rev==temp){
            system.debug('pallindrome');
        }
        else{
            system.debug('not pallindrome');
        }
        System.debug(rev);
    }    
}