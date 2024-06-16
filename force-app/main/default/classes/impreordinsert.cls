public class impreordinsert {
    @AuraEnabled
    public static list<Account> getdata(string sname){
        list<Account>lsacc=new list<Account>();
        if(sname!=null){
            account acc=new account();
            acc.name=sname;
            lsacc.add(acc);
        }
        if(!lsacc.isempty()){
        insert lsacc;
        return lsacc;
        }
        return null;
    }
   
    

}