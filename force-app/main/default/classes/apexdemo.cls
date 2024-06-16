public class apexdemo {
    public static void meth(){
        list<Integer>lsacc=new list<integer>();
        lsacc.add(1);
        lsacc.add(3);
        System.debug('After Adding, Collection Size...: ' +lsacc.size());

        lsacc.remove(1);
        System.debug('After remove, Collection Size...: ' + lsacc.size());

    }
    
    public static void dmlmet(){
        list<Account>lsacc=new list<Account>();
        for(integer i=0;i<=3;i++){
            Account acc=new Account();
            acc.name='Elvish'+i;
            acc.phone='2345345'+i;
            lsacc.add(acc);
            System.debug('the value is' +acc);
        }
        insert lsacc;
        system.debug('the value is'+lsacc);
    }
    
    public static void dlt(){
        list<Account>lsacc=[select id,name,rating,phone from account where name like 'b%'];
        delete lsacc;
        
    }
    
    public static void undlt(){
        undelete[select id,name,phone from account where name like 'ram1' and isdeleted= true ALL ROWS];
        
    } 
    
    public static void updt(){
        list<Account>lsacc=[select id,name,phone from account where name like'ram2'];
        for(Account acc:lsacc){
            acc.name='Rakhi';
        }
        update lsacc;
        
    }        
        public static void upsrt(){
            list<Account>lsacc=new list<Account>();
            list<Account>lsaccount=[select id,name,phone from account where name like 'ram1'];
            
            for(Account acc:lsaccount){
                acc.Name='Raghav';
                lsacc.add(acc);
                
            }
            Account a=new account();
            a.Name='Ragni';
            a.Phone='123456';
            lsacc.add(a);
            //insert lsaccount; 
            upsert lsacc;
        }
    
    //Write an apex program, to DeActivate the User based on the specified user name at runtime.
    
    public static void DeactivateUser(string uname){
        user userTodeactive=[select id,firstName,lastName,userName,IsActive FROM user where userName = :uname AND IsActive =true];
        userTodeactive.IsActive=False;
        update userTodeactive;
    }
    
    
    public static void fetchrec(){
        list<Opportunity>lsopp=[select id,name from opportunity where name like 'B%'];
        for(Opportunity opp:lsopp){
            System.debug('the record are'+lsopp);
            System.debug('the size of record is=============>'  +lsopp.size());
        }
    }
        
        public static void caserec(){
            map<Id,Case>lsmap=new map<Id,Case>([select id,caseNumber,origin,type,priority,status from case limit 5]);
            for(case cs:lsmap.values()){
               // System.debug('The record size is' +cs.size());
                System.debug('the record are======>' +cs);
            }
        }
    
    public static void indrec(){
        list<Lead>leadacc=[select id,firstname,lastname,industry,rating from Lead where Industry='Banking' limit 5];
        for(Lead ld:leadacc){
            System.debug('the record are======>' +ld);
        }
    }
}