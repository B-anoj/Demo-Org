@isTest
public class opportunitytriHandlerTest {
    @isTest
    public static void updatedesc(){
        list <opportunity> opplist=new list<opportunity>();
        for(integer i=0;i<5;i++)
        {
            opportunity op=new opportunity();
            op.Name='Test'+i;
            op.closeDate=system.today();
            op.Description='prospecting';
            op.Amount=200000;
            opplist.add(op);
        }
        Test.startTest();
        insert opplist;
        Test.stopTest();
        
        list<opportunity>updatedopplist=[select id,name,description from opportunity where Id =:opplist[0].Id];
        system.AssertEquals('Hot opportunity',updatedopplist[0].Description);
    }

}