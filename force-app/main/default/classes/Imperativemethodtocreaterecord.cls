public class Imperativemethodtocreaterecord {
    @AuraEnabled
    public static list<account> imperativemeth(string accountnames,string accountphones){
        list<account> lsacc=new list<account>();
        if(accountnames !=null){
                account acc=new account();
                acc.Name=accountnames;
                acc.Phone=accountphones;
                lsacc.add(acc);
    } 
    if(!lsacc.isEmpty()){
        insert lsacc;
        return lsacc;
    }
    return null;
}
}