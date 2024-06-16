public class Forloop1 {
    public static void formeth(){
        list<Account> lsacc=new list<Account>();
        
        for(integer i=0;i<2;i++){
            Account acc=new Account();
            acc.Name='Rohit';
            acc.phone='3245675';
            lsacc.add(acc);
            insert lsacc;
            System.debug('record are '+lsacc);
            
        }
    }
}