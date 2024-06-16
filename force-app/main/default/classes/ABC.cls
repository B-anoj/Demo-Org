public class ABC {
   //i.	Method Fun1 -> Non Parameterized method, no return statement , Static 
    public ABC(){
       Fun1();  
    }
    
    Public static void Fun1(){
        
        list<Id> lsId = new list<Id>();
        list<Account> Accountlist =[select id ,name from Account limit 5];
        For(Account acc :Accountlist){
            lsId.add(acc.Id);
            System.debug('Account list are'+acc);
            System.debug('Account list are'+lsId);
        }
        
        
        
        //ii.	Fetch the list of opportunities as per the provided Id of the accounts and return 
        //the list of opportunities from XYZFun2 method.
     
        List<Opportunity> allopps = XYZ.XYZFun1(lsId);
        for(Opportunity opp : allopps){
            System.debug('Opportunities :===>'+opp);
        }
        
        //i.	Call the fun5 method from fun1 and pass the account id.
        
        List<XYZ.Wrappercls> wapers =Fun5(lsId);
        System.debug('Id are:::::'+lsId);
        
        For( XYZ.Wrappercls w :wapers){
            System.debug('Wrapper class is:::::'+w);
        } 
        
    }
    //ii.	Method Fun2 -> Parameterized Method , Return list of opportunity , Static 
    
    public static List<Account> Fun2(List<Id> acc){
        list<Id> IdList = new list<Id>();
        List<Account> accReord =[select id,name from Account where Id in : acc]; 
        for(Account accs : accReord){
        //    IdList.add(accs);
        }
        System.debug('Detail of Account Id  are::::' +IdList);
        return accReord;
        
    }
    
    //iii.	Method Fun3 -> Parameterized Method , Return List of opportunity , Static 
    
    public static List<Opportunity> Fun3(List<Id>oppsId){
         List<Opportunity> opportunitylist =[Select Id,Name from Opportunity where Id IN : oppsId];
         System.debug('opportunity list' +opportunitylist);
         return opportunitylist;
    }
    
    //iv.	Method Fun4 -> Parameterized Method , Return WrapperClass , Non Static method
    //
    public Static wrapperclass Fun4(Id OppId){
        wrapperclass wrap = new wrapperclass();
        return wrap;
    }
    public class wrapperclass{
        
    }
    
    //v.	Method Fun5 -> parameterized Method, Return type List<Wrapper Class> , Status method.
    
       public static List<XYZ.Wrappercls> Fun5(List<Id> accIds){
        	List<XYZ.Wrappercls> wraps = XYZ.XYZfun3(accIds);
        	return wraps;
       }

}