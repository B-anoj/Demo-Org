public class daterequest {
    
    public static void getcon(datetime sdate){
      list<account>lsacc= [select Id,name,phone,industry,CreatedDate from account where CreatedDate<=:sdate ];
        system.debug('account'+lsacc);
    }

}