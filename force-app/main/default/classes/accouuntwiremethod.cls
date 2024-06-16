public class accouuntwiremethod {
    @AuraEnabled(cacheable=true)
    public static list<Account> getcon(Integer rowOffset){
       Integer pageSize = 50;
        Integer offset = rowOffset;
        return[select Id, Name,phone,Rating,OwnerId from Account order by Name LIMIT :pageSize OFFSET :offset];
    } 
}