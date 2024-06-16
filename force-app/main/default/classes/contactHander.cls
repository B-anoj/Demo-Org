public class contactHander {
    @AuraEnabled(cacheable=true)
    public static list<contact> getcon(){
        return[select id,name from contact];
    }

}