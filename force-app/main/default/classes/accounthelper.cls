public class accounthelper {

    @AuraEnabled
    public static list<account>lsaccount(){

        return[select id ,name from account];
    }
     

      @AuraEnabled
    public static list<account>createaccount(string cname){
        list<Account>newacc=new list<Account>();
        if(cname !=null){
            account acc=new account();
            acc.name=cname;
            newacc.add(acc);
        }
        if(!newacc.isempty()){
            insert newacc;
            return newacc;
        }

        
        return null;
    }
}