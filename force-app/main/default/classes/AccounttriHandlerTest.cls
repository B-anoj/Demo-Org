@isTest
public class AccounttriHandlerTest {
    @isTest
    public static void updateRatingTest(){
        //Created sample Data
        list<account>lsacc=new list<account>();
        for(integer i=0;i<5;i++)
        {
            account acc=new account();
            acc.name='Rohit'+i;
            acc.industry='Energy';
            System.debug(acc);
            lsacc.add(acc); 
            System.debug(lsacc);
        }
        Test.startTest();
        insert lsacc;
        Test.stopTest();
         
        list<account> updtacclst= [select id,name,rating from account where id =:lsacc[0].id];
        //aply assert condition
        System.assertEquals('Hot', updtacclst[0].Rating);
    }   
}