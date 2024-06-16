public class demo1 {
    public static void m1(string name){
        list<account> lsacc=[select id,name from account where name like :'%'+name];
        for(account acc:lsacc)
        {
            System.debug(acc);
        }
    }
    
    public static void m2(){
        list<account> lsacc=new list<account>();
        for(integer i=0;i<=9;i++)
        {
            account acc=new account();
            acc.name='paropp'+i;
            lsacc.add(acc);
            system.debug(acc);
            
        }
        insert lsacc;
        
    }
    
   
/*create an Apex class that inserts a new account named after an incoming parameter. 
    If the account is successfully inserted,
    the method should return the account record.
    If a DML exception occurs, the method should return null */
    
   /* public static m3(string name){
        try{
            account acc=new account();
            acc.name=name;
            insert acc;
            return acc;
        }
        catch(DMLException e){
            return null;
        }
        
    }  */
/*If the SOQL Query returns Only One record as a result, 
 then we need to store the result, by 
creating a variable of the associated type   */
    
    public static void m4(){
        Account acc=[select id,name,rating,Industry from account limit 1];
        System.debug(acc.name);
        System.debug(acc.id);
        System.debug(acc.Industry);
    }
    
    
   /*fetching multiple record in apex programming
    */
    public static void m5(){
        list<Account> acc=[select id,name,rating,Industry from account where rating='hot'];
        
        for(account a:acc)
        {
            system.debug('account name is:'+a.name);
            system.debug('account id is:'+a.id);
            system.debug('account rating is:'+a.industry);
            system.debug('account rating is:'+a.rating);
            
            system.debug(acc.size());
        }
    }
    
    /* Write an apex program, to fetch te records from the object,
     *  based on the specified Limit and Offset 
values at runtime. */
    
    public static void m6(){
        list<account> acc=[select id,name,active__c,rating,phone from account  offset:156];
        
        for(account a:acc)
        {
            system.debug(a);
        }
        
    }
    
    
    /* Write an SOQL Query to fetch all the Active Users who are associated to "CIS Platform Profile" */
    
    public static void m7(){
        list<User>activeuser=[select id,firstname,lastname,isactive,profile.name,email 
                              from user where profile.name='CIS platform profile' AND ISactive=true];
        for(user us:activeuser)
        {
            System.debug(us);
        }
    }
    
   /* Write an Apex program, to fetch all the account based on the specified name at runtime */
    
    public static void m8(string name){
        list<account> ls=[select id,name,rating,fax,Address__c from account where Address__c =:name];
        for(account a:ls)
        {
            System.debug(a);
           system.debug('size is:'+ ls.size());
        }
    }
    
    /* Write an apex program, to fetch all the 
Duplicate Account records based on the Account Name. 
    
    public static void m9(){
        list <account> acc=[select id,name,count(id)recordscount,rating 
                            from account group by name having count(id)>1];
    }*/
    
    public static void m10(){
        list<account> acc=[select id ,name, rating from account where IsDeleted = true ALL ROWS];
        for(account acc1:acc)
        {
            system.debug(acc1);
        }
    }
    
    
    public static void m11(string charname)
    {
        list<account> lsaccount=[select id,name from account where name like:'%'+charname+'%'];
        delete lsaccount;
    }
    
}