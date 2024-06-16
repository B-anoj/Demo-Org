public class dml {
    
    public static void dmldemo(){
        
       
        account acc=new account ();//instance account
         acc.Name='Test2';
           Database.insert (acc, false); 
        system.debug('Record id'+acc.id);
        
    }
    
    public static void bulkdemo(){
        //delete[select id,name ,rating from account limit 1];
        
        list<account>lsaccount=[select id,name,rating from account where name like 'r%'];
        delete lsaccount;
        system.debug('the deleted record are===>'+lsaccount);
          
}
    
    public static void bulkupser(){
        
        list<account>lsaccount=new list<account>();
        
        //update rating 
        list<account>upaccountlist=[select id,name ,rating from account];
            for(Account acc:upaccountlist){
                acc.Rating='cold';
                lsaccount.add(acc);
            }
        
        //inserting account record
        account a=new account();
        a.name='test11';
        lsaccount.add(a);
        upsert lsaccount;
    }
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
                                          where name like 'Test%']);
    delete acc;
    }
    
    public static void undeletedmeth(){
        list<account>acc=new list<account>([select id,name,rating from account 
                                          where name like 'chatgp%' and isDeleted=true all rows]);
       undelete acc; 
    }
    
    public static void updatemeth(){
        list<account>updatelsacc=new list<account>([select id,name,rating from account where rating='hot' limit 100]);
        for(account acc:updatelsacc){
            acc.rating='cold';
            acc.industry='finance';
        update acc;
            System.debug(acc);
        }
        
        }
    public static void upsertmeth(){
        list<account>lsacc=new list<account>();
        
        //update the list of record
        
        list<account>updatelist=new list<account>([select id,name,industry from account where industry='Banoj']);
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