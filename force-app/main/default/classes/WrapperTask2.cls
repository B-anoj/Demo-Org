// //Create Wrapper class to fetch all Acccount,Contact & Lead List for loged in user.
    
public class WrapperTask2 {
     
    public static List<wrpcls> getlistOfUserRecord(){
        List<wrpcls> wrapperList = new List<wrpcls>();
        
        wrpcls wrp = new wrpcls();
        Id loggedInUserId = UserInfo.getUserId();
        wrp.AcclIst = [Select Id,Name from Account where OwnerId =: loggedInUserId];
        System.debug('List of account record:::' +wrp.AcclIst);
        /*for(Account acc : wrp.AcclIst){
            System.debug('the acc :::'+acc);
        }*/
        wrp.conlist = [Select Id,FirstName from Contact where OwnerId =: loggedInUserId];
        System.debug('List of contact record:::' +wrp.conlist);
        wrp.LeadList = [Select Id,LastName from Lead where OwnerId =: loggedInUserId];
        System.debug('List of contact record:::' +wrp.LeadList);
        wrapperList.add(wrp);
        return wrapperList;
    }
    public class wrpcls {
        public List<Account>AcclIst;
        public List<Contact>conlist;
        public List<Lead>LeadList;
    }
    
}