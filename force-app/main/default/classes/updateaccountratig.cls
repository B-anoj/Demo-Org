public class updateaccountratig {
    public static void accup(){
    list<account> acc=new list<account>([select id,name,rating from account where rating='hot']);
        for(account a:acc){
            a.Industry='Finance';
            //acc.add(a);
            system.debug('account list are'+a);
        }
        update acc;
        
     }

}