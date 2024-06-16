public class updatedrecord {
    public static void descriptionUpdate(){
        list<Account> acc=[select id,description
                                             from account order by 
                                             createdDate  LIMIT 5];
        for(Account ac:acc)
        {
            ac.description='Saving account';
            system.debug(ac.Description);
        }
        update acc;
    }

}