public class impdemocls {
    @AuraEnabled
    public static list<contact> meth(){
        return [select id,name,phone from contact];
    }
}