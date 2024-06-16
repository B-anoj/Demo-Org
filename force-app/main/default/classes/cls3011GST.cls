public class cls3011GST {
    public static void GST(list<patient__c> lspai){
        for(patient__c pa:lspai)
        {
            pa.RegistrationFees__c = pa.RegistrationFees__c * 1.1;
        }
    } 

}