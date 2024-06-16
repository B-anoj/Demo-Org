public class AccounttriggerHandlerdemo {
    public static void accmeth(List<Account>NewList){
        for(Account acc:NewList){
            if(acc.Industry=='Media' || acc.Industry=='Energy'){
                acc.Rating='Hot';
            }
        }
        
    }

}