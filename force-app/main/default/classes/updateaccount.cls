public class updateaccount {
    public static void updateMethod(){
        List<Account> acc=[select id,description from Account order by createdDate limit 5];
        for(Account ac:acc)
        {
            ac.description='saving account';
            System.debug('ac.description');
        }
        update acc;
    }
 
}