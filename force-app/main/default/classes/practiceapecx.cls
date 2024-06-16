public class practiceapecx {
    public static void MethPrac(){
       list<Account>lsacc=new list<Account>();
       
        for(integer i=0;i<=5;i++){
            Account acc=new Account();
            acc.name='ramaya'+i;
            acc.phone='98766789'+i;
            lsacc.add(acc);
            System.debug('the record are '+acc);
        }
        insert lsacc;
        System.debug('the record are '+lsacc);
    }

}