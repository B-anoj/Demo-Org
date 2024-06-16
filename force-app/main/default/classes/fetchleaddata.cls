public class fetchleaddata {

    @AuraEnabled
    public static List<Lead> getListRec(){
        List<Lead> Lsrec = [SELECT Id, Name, Company, Status FROM Lead ORDER BY CreatedDate DESC LIMIT 5];
        return Lsrec;
    }

    @AuraEnabled
    public static void fetchleaddatamethod(){
        list<lead> ls=([select id,firstname,lastname,status,email,
                        phone,fax from lead]);
        System.debug('lead object size is' +ls);
        if(!ls.isEmpty())
        {
            for(lead le:ls)
            {
                System.debug('lead id is'+le.id);
                System.debug('lead firstname is'+le.firstname);
                System.debug('status is'+le.status);
                System.debug('email is'+le.phone);
                System.debug('fax is'+le.fax);  
            }
            System.debug('list of lead recod is'+ls);
        }
    }

}