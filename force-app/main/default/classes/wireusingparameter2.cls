public class wireusingparameter2 {
        @AuraEnabled(cacheable=true)
        public static list<contact> findcontacts(String searchtext)
        {
            string key ='%'+searchtext+'%';
            return [select Id,Name,Phone from contact where firstname like: key];  
        }
    

}