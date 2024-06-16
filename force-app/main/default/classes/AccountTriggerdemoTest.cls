@isTest
public class AccountTriggerdemoTest {
   // @isTest
    public testmethod static void ratingmeth(){
        
        //create sample data
        list<Account>lsacc=new list<Account>();
        for(Integer i=1;i<=5;i++){
            account ac=new account();
            ac.name='Kargo'+i;
            ac.Industry='Energy';
            ac.Rating='Hot';
            ac.phone='1343234';
            lsacc.add(ac);
            
        }
        //insert data
        
        Test.startTest();
        insert lsacc;
        Test.stopTest();
        
        list<Account> Updateaccount=[select id,name,Rating from account where Id=:lsacc[0].Id];
        //apply assertcondition
        System.assertEquals('Hot', Updateaccount[0].Rating);
    }

}