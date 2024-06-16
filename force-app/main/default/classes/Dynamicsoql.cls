public class Dynamicsoql {
    public static void dynamicsoql(string cname){
        string searchname='select id,name,phone  from account where name=:cname';
        list<account> lsacc=Database.query(searchname);
        System.debug(lsacc);
        for(account acc:lsacc)
        {
            System.debug('record are '+acc);
        }
    }
    

}