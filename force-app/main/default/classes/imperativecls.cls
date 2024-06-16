public class imperativecls {
    @AuraEnabled
    public static list<Account> getaccdata(string cname){
        list<Account>lsacc=new list<Account>();
        if(cname!=null){
            account acc=new account();
            acc.name=cname;
            lsacc.add(acc);
        }
        insert  lsacc;
        return lsacc;


    }

}