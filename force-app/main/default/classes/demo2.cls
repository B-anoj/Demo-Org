public class demo2 {
    public static void accrec(){
        account acc=new account();
        acc.name='Sonu1';
        acc.phone='43454';
        insert acc;
    }
    
    
    public static void lop(){
        list<account> lsacc=new list<account>();
        for(integer i=1;i<15;i++)
        {
            account acc=new account();
            acc.name='chatgpt'+i;
            lsacc.add(acc);
        }
        insert lsacc;
    }
    
    public static void soql(){
        list<account>lsacc=[select id,name,phone from account limit 10];
        
        for(account acc:lsacc){
            system.debug('the account id is'+acc.id);
            System.debug(acc);
        }
        
    }

}