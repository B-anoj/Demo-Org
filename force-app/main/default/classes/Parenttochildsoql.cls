//Parent to child soql
public class Parenttochildsoql {
    public static void parentsoqlmeth(){
        list<Account> lsacc=[select id,name,phone,(select id,name,phone from contacts) from account where id !=null limit 2];
        
        if(!lsacc.isEmpty())
        for(Account acc:lsacc){
            for(Contact con:acc.contacts){
                con.phone=acc.phone;
                
            }
            if(!lsacc.isEmpty()){
            update lsacc;
            }
        }
    }

}