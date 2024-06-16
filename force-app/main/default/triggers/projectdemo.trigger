trigger projectdemo on Customer_Project__c (after insert,after update) {
    set<id> lsset=new set<id>();
    for(Customer_Project__c cp:Trigger.New){
        if(cp.Status__c =='Active' && cp.Opportunity__c != null){
            lsset.add(cp.Opportunity__c);
        }
        if(!lsset.IsEmpty()){
            list<Opportunity> lsopp=[select id, project_field__c FROM opportunity where Id in : lsset];
            for(Opportunity opp:lsopp){
                opp.project_field__c = true;
            }
            update lsopp;
        }
    }

}