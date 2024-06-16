public class contactrangedata {
    @AuraEnabled(cacheable=true)
    public static list<Account> getcon(date sdate,date edate){
      return [ select Id,name,phone,industry,CreatedDate from account ];
    }

}