public class TriggerContextVariableclass {
    public static void BeforeInsert(List<Account>NewList){
        for(Account acc:NewList){
            if(acc.Industry != Null && acc.Industry == 'Energy'){
                acc.rating='cold';
                System.debug('Before insert operation'+acc);
            }else{
                acc.rating='hot';
            }
        }
    }
//When account is created automatically contact also created.   
        public static void accountcrecontcrt(list<Account>NewList){
            list<contact>lscon=new list<contact>();
            for(Account acc:Newlist){
                contact con=new contact();
                con.accountId=acc.Id;
                con.Lastname=acc.name;
                con.phone=acc.phone;
                lscon.add(con);
                System.debug('contact record'+con);
            }
            if(!lscon.isEmpty()){
            insert lscon;
            System.debug('list of contact record'+lscon);    
            }
        }
    //when update the phone automatically  description also update.
    public static void updatePhoneDescription(List<Account> NewList,Map<Id,Account> oldMap){
        for(account acc:NewList){
            if(oldMap != null && acc.phone != oldMap.get(acc.Id).Phone){
                acc.Description='Phone is modifie on Account';
            }
        }
    }
    
    public static void accountrecordusingMap(List<Account>NewList,Map<Id,Account>NewMap){
        
    }
}