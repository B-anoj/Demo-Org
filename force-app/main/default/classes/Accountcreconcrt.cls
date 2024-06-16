//when account is created automatically contact is created
public class Accountcreconcrt {
    public static void acccrtmeth(List<Account>NewList){
        List<contact>lscon=new list<contact>();
        for(Account acc:NewList){
        Contact con=new Contact();
            con.accountid=acc.Id;
            con.phone=acc.phone;
            con.LastName=acc.Name;
            lscon.add(con);
        }  
        insert lscon;
    }

}