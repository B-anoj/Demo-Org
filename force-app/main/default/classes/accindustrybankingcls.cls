//When ever the Account is created with Industry as Banking then create a contact for account, 
//Contact Lastname as Account name and contact phone as account phone.
public class accindustrybankingcls {
    public static void accmeth(list<Account>NewList){
        list<Contact>lscon=new list<Contact>();
        for(Account acc:NewList){
            if(acc.industry=='Banking'){
                Contact con=new contact();
                con.AccountId=acc.Id;
                con.LastName=Acc.name;
                con.phone=acc.phone;  
                lscon.add(Con);
            }
            insert lscon;
        }
        
    }

}