public class deleterecord {
    public static void dltmeth(){
        list<Account>lsacc=[select id,name,phone from account where name like 'a%'];
        
        delete lsacc;
    }

}