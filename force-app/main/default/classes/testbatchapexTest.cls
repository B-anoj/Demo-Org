@isTest
public class testbatchapexTest {
    public testmethod static void testdemo(){
        list<account>lsaccount=new list<account>();
        for(integer count=0;count<30;count++){
            account acc=new account();
            acc.name='sachin'+count;
            acc.AnnualRevenue=50000;
            acc.Phone='2345654';
            lsaccount.add(acc);
        }
        insert lsaccount;
        
        //Invoke the batche class
        
        Test.startTest();
        testbatchapex tb=new testbatchapex();
        Database.executeBatch(tb);
        Test.stopTest();
        
        
    }
}