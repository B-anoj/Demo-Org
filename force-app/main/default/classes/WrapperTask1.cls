public class WrapperTask1 {
    public static List<WrapperClass> getUserRecordCount() {
        Id loginUser = UserInfo.getUserId();
        
        List<WrapperClass> wrapperList = new List<WrapperClass>();
        
        WrapperClass wp = new WrapperClass();
        
        wp.accountCount = [SELECT COUNT() FROM Account WHERE OwnerId = :loginUser];
        System.debug('Account Count: ' + wp.accountCount);
        wp.contactCount = [SELECT COUNT() FROM Contact WHERE OwnerId = :loginUser];
        System.debug('Contact Count: ' + wp.contactCount);
        wp.opportunityCount = [SELECT COUNT() FROM Opportunity WHERE OwnerId = :loginUser];
        System.debug('Opportunity Count: ' + wp.opportunityCount);
        wp.caseCount = [SELECT COUNT() FROM Case WHERE OwnerId = :loginUser];
        System.debug('Case Count: ' + wp.caseCount);
        wp.leadCount = [SELECT COUNT() FROM Lead WHERE OwnerId = :loginUser];
        System.debug('Lead Count: ' + wp.leadCount);
        
        wrapperList.add(wp);
        
        return wrapperList;
    }
    
    public class WrapperClass {
        public Integer accountCount { get; set; }
        public Integer contactCount { get; set; }
        public Integer caseCount { get; set; }
        public Integer opportunityCount { get; set; }
        public Integer leadCount { get; set; }
    }
}