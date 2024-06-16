trigger mapcontextvariable on Contact (before insert) {
    //if(trigger.isbefore && trigger.isupdate){
        System.debug('----this will fire only on before update');
        System.debug('Trigger.new-->'+trigger.new);//23:16:05:052 USER_DEBUG [3]|DEBUG|Trigger.new-->
        //(Contact:{Id=null, IsDeleted=false, MasterRecordId=null, AccountId=null, Salutation=null, FirstName=null, LastName=con1, OtherStreet=null, OtherCity=null, OtherState=null, OtherPostalCode=null, OtherCountry=null, OtherLatitude=null, OtherLongitude=null, OtherGeocodeAccuracy=null, MailingStreet=null, MailingCity=null, MailingState=null, MailingPostalCode=null, MailingCountry=null, MailingLatitude=null, MailingLongitude=null, MailingGeocodeAccuracy=null, Phone=null, Fax=null, Mobile
        
        System.debug('Trigger.newMap-->'+trigger.newMap);//null
        System.debug('Trigger.old-->'+trigger.old);//null
        System.debug('Trigger.oldMap-->'+trigger.oldMap);//null
    
    
    //if(trigger.isafter && trigger.isupdate){
        System.debug('----this will fire only on after update');
        System.debug('Trigger.new-->'+trigger.new);//23:26:14:069 USER_DEBUG [14]|DEBUG|Trigger.new-->(Contact:{Id=null, IsDeleted=false, MasterRecordId=null, AccountId=null, Salutation=null, FirstName=null, LastName=con4, OtherStreet=null, OtherCity=null, OtherState=null, OtherPostalCode=null, OtherCountry=null, OtherLatitude=null, OtherLongitude=null, OtherGeocodeAccuracy=null, MailingStreet=null, MailingCity=null, MailingState=null, MailingPostalCode=null, MailingCountry=null, MailingLatitude=null, MailingLongitude=null
    // MailingGeocodeAccuracy=null, Phone=null, Fax=null, Mobil
        System.debug('Trigger.old-->'+trigger.old);        
    
    
}