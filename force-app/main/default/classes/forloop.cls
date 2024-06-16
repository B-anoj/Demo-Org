public class forloop {
    public static void formet(){
        list<Doctor__c> acc=new list<Doctor__c>();
        for(Integer i=1;i<21;i++)
        {
           Doctor__c a=new Doctor__c();
            a.name='virat' + i;
            acc.add(a);
            system.debug('name list' +a);
        }
        insert acc;
         list<Doctor__c> acc1=new list<Doctor__c>();
        for(Integer i=1;i<21;i++)
        {
           Doctor__c a=new Doctor__c();
            a.name='virat' + i;
            acc1.add(a);
            system.debug('name list' +a);
        }
        insert acc1;
        
        list<contact> conlist= new list<contact>();
        for(Integer i=0;i<20;i++)
        {
            contact con=new contact();
            con.lastname='ac'+i;
            conlist.add(con);
            
        }
        insert conlist;
        
        
    }
    
}