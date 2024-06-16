public class Insertop {
    public static void insertmeth(){
        list<Account>lsacc=new list<Account>();
        for(integer i=1;i<50;i++)
        {
            account acc=new account();
            acc.name='chatgpt'+i;
            system.debug(acc);
            lsacc.add(acc);
        }
        insert lsacc;
        System.debug(lsacc);
    }
    
    public static void deleterec(){
    list <account> acc=new list<account>([select id,name,rating from account 
                                          where name like 'salesforce']);
    delete acc;
    }
    
    public static void undeletedmeth(){
        list<account>acc=new list<account>([select id,name,rating from account 
                                          where name like 'salesforce' and isDeleted=true all rows]);
       undelete acc; 
    }
    
    public static void updatemeth(){
        list<account>updatelsacc=new list<account>([select id,name,rating from account where rating='hot' limit 100]);
        for(account acc:updatelsacc){
            acc.rating='cold';
            acc.industry='finance';
            updatelsacc.add(acc);
            System.debug(acc);
        }
        update updatelsacc;
    }
    public static void upsertmeth(){
        list<account>lsacc=new list<account>();
        
        //update the list of record
        
        list<account>updatelist=new list<account>([select id,name,industry from account where industry='finance']);
        for(account acc:updatelist){
            acc.Industry='energy';
            lsacc.add(acc);
            system.debug('the updated record are'+lsacc);
        }
        
        //insert the list of record
        list<account> lsinsertacc=new list<account>();
        for(integer i=0;i<50;i++){
        account a=new account();
        a.name='siri'+i;
        lsinsertacc.add(a);    
        }
        lsacc.addall(lsinsertacc);
        system.debug('the inserted record is====================>'+lsacc);
        upsert lsacc;
    }
}