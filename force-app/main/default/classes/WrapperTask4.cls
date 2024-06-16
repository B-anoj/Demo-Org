//Using wrapper show Opportunity & opportunity line item

public class WrapperTask4 {
    public static List<wrapperDemo> opportunityLineDemo(Id opportunityId){
        List<wrapperDemo> lsWrapper = new List<wrapperDemo>();
        wrapperDemo wrapper = new wrapperDemo();
        
        wrapper.opportunity = [Select Id, Name, StageName
                               From Opportunity 
                               WHERE Id = : opportunityId];
        
        wrapper.opportunityLineItems = [SELECT Id, Quantity, UnitPrice, TotalPrice from OpportunityLineItem where Id = : opportunityId];
        lsWrapper.add(wrapper);
        return lsWrapper;
    }
     
    
    public class wrapperDemo{
        public Opportunity opportunity { get; set; }
        public List<OpportunityLineItem> opportunityLineItems { get; set; }
    }

}