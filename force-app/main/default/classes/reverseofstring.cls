public class reverseofstring {
    String str='Banoj';
    string rev='';
    public void stringmethod(){
        for(integer i=str.length()-1;i>=0;i--){
            rev=rev+str.substring(i,i+1);
        }
        System.debug('string reverse'+rev);
    }
    
}