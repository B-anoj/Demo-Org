public class offset {
    public static void offmet(integer limitValue, integer offsetValue){
        list<account> acc=[select id,name from account order by name limit : limitValue offset : offsetValue];
       // integer sizerec=acc.size();
        system.debug('size of record is' +acc.size());
        for (account a:acc)
        {
           
            system.debug('account record are'+a);
        }
    }
    
}