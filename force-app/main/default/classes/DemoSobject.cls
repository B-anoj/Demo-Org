public class DemoSobject {
    public static void DemoMethod(){
        Account acc = New Account();
        acc.Name = 'Testing1';
        acc.Phone ='7789051676';
        insert acc;
        System.debug('acc=====>'+acc);
    }
    
     public static void DemoMethod1(){
     list<Account> lsacc = new list<Account>();   
       for(Integer i=0;i<2;i++){
        Account acc = New Account();
        acc.Name = 'Testing1' + i;
        acc.Phone ='7789051676';
        lsacc.add(acc);
        }
        insert lsacc;
        System.debug('lsacc=====>'+lsacc);
    }
    public static void DemoMethod2(){ 
        list<Account> acclist = [Select Id,Name,Phone,(Select Id,Phone From Contacts) CreatedDate from Account Order By CreatedDate Asc limit 5];
        for(Account acc : acclist){
            acc.Name = 'Update1';
            acc.Phone = '777890123';
            Update acc;
            System.debug('acc====>'+acc);
        }
    }
        public static void DemoMethod3(String accId,String Name,String Phone){ 
           try{
            Account acc = [Select Id,Name,Phone from Account where Id =: accId];
            if(acc != null){
                acc.Name = Name;
                acc.Phone = Phone;
                Update acc;
                System.debug('acc====>'+acc);
            }
            else{
                System.debug('No Account with Id'+acc);
            }
          }
          
            Catch(Exception e){
                System.debug('An Error Occoured'+e.getMessage());
            }                 
        }
    
    public static void DemoMethod4(){ 
       try{
        Set<Id> accId = New Set<Id>();
        List<Account> acclist = [Select Id,Name From Account Limit 2];     
        if(acclist != null && !acclist.isEmpty()){
            for(Account acc : acclist){
                accId.add(acc.Id);
                System.debug('accId====>'+accId);
            }
            System.debug('accId====>'+accId);
        }       
       else {
            System.debug('No records found in acclist.');
        }
      }Catch(Exception e){
        System.debug('An Error Occoured'+e.getMessage());
    }
}
}