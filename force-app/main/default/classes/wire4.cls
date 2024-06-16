public class wire4 {
    @AuraEnabled(cacheable=true)
    public static list<lead> getmethod(){
        return[select id,name from lead];
    }
}