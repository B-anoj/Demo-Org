public class XYZ {
    // Method XYZFun1 -> Parameterized Method, List<Opportunity> Static Method
    public static List<Opportunity> XYZFun1(List<Id>AccIds){
      //  List<Opportunity> opportunitylist =[Select Id,Name from Opportunity where Name IN : OpportunityName];
        List<Opportunity> opportunitylist = XYZFun2(AccIds);
        System.debug('List of opportunity from xyz class :::==>'+opportunitylist); 
       
        return opportunitylist;
    }
    
    //Method XYZFun2 -> Paramererized method, List<Opportunity> Static method.
    public static list<Opportunity> XYZFun2(List<Id> accIds){
        List<Opportunity> listofopp =[select Id,Name from Opportunity 
                                      Where AccountId IN : accIds];
        return listofopp;
    }
    
    //Method XYZFun3 -> Parameterized Method, List<Wrapper> static method
   //ii.	Write the logc un xyzFun3 method to fetch contact list, opportunity 
   //list,case list as per the provided account id.(Bulkify data)
    Public static list<Wrappercls> XYZfun3(List<Id>acc){
        List<Wrappercls> listWrapper = new List<Wrappercls>();
        
        for(Id accId : acc){
            Wrappercls  wp =new Wrappercls(); 
            list<Opportunity> allopp=[select Id ,Name from Opportunity where AccountId  = : accId];
            wp.opplist=allopp;
            list<Contact> allcon =[select Id ,LastName from Contact where AccountId  = : accId];    
            wp.conlist = allcon;
            list<Case> allcase =[select Id ,Status from Case where AccountId  = : accId]; 
            wp.caselist = allcase;
       
            listWrapper.add(wp);
    	}
         return listWrapper;
    }
    
    
    public Class Wrappercls{
        List<Opportunity>opplist;
        list<Contact>conlist;
        list<Case>caselist;
    }
}