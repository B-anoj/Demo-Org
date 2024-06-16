public class opportunitytriHandler {
    public static void method1(list<opportunity>listopp){
        for(opportunity opp:listopp)
        {
            if(opp.amount>=1000 && opp.amount<=5000)
            {
                opp.Description='Hot world';
            }
        }
    }

}