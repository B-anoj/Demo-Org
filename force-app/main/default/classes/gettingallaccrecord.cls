public class gettingallaccrecord {
@AuraEnabled(cacheable=true)
public static list<Account> getaccdata(Integer offset){
Integer pageSize = 15;

    return [select id,name,phone from account order by name limit: pageSize OFFSET:offset];
}

}