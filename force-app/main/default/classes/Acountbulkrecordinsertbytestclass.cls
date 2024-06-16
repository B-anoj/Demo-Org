public class Acountbulkrecordinsertbytestclass {
    public static void accountdemo(){
        list<account> lsacc=new list<account>();
        for(integer i=0;i<20;i++){
            account acc=new account();
            acc.name='rakesh'+i;
            acc.phone='1234567';
            acc.rating='hot';
            lsacc.add(acc);
            system.debug('inside the for loop======>'+acc);
        }
        insert lsacc;
        System.debug('ouside the for loop'+lsacc);
    }
}