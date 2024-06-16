public class sosleg1 {
    public static void meth(){
        list<list<sObject>> searchlist=[find 'tcs' in all fields returning 
                                        Account(name),contact(id,name),lead(id,name)];
        list<Account> acclist=(list<Account>)searchlist[0];
        list<Contact> conlist=new list<Contact>();
        list<lead> ldlist=new list<lead>();
        
        //acclist=(list<Account>)searchlist[0];
        conlist=(list<Contact>)searchlist[1];
        ldlist=(list<lead>)searchlist[2];
        
        for(account a:acclist)
        {
            System.debug('the number of Account search record is' +a);
        }
        for(contact c:conlist)
        {
            System.debug('the number of contact search record is' +c);
        }
        
        for(lead l:ldlist)
        {
            System.debug('the number of ld search record is' +l);
        }
    }
    
}