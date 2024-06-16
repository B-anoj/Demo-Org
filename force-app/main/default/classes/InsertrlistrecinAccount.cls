public class InsertrlistrecinAccount {
    public static void m12()
    {
        list<account> lsacc=new list<account>();
        for(Integer i=0;i<50;i++)
        {
            account ac=new account();
            ac.name='Alexa'+i;
            lsacc.add(ac);
            System.debug(ac);
        }
         insert lsacc;
    }
    public static void m13()
    {
        list<account> acc=[SELECT id, Name FROM account where Name Like:'a%' and isDeleted=true all rows];
        system.debug(acc);
    }
    
}