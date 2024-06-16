public class account1helper {
    
    public static void ratingupdate(list<account>lsaccount){
        for(account acc:lsaccount){
            acc.rating='hot';
        }
    }
    
    public static void createcontact(list<account>lsaccount){
        list<contact>lscontact=new list<contact>();
        for(account acc:lsaccount){
            contact con=new contact();
            con.lastname=acc.name;
            con.AccountId=acc.id;
            lscontact.add(con);
        }
        insert lscontact;
    }
    public static boolean flag=true;
    public static void callaccount(){
        if(flag==true){
            flag=false;
            account acc=new account();
            acc.name='text';
            acc.rating='hot';
            insert acc;
        }
        
        
    }
}