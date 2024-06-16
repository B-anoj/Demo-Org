public class Accountconraltedsearchdata {
    
@AuraEnabled(cacheable=true)
  public static List<Contact> getContactlist(string accId , String searchKey) {
// if search key is available
if(searchKey != null && searchKey !=''){
    String key = '%'+ searchKey +'%';  // search key
list<Contact> consearchlist = [SELECT ID,Name, Phone,accountId from Contact where accountid=:accId AND Name LIKE : searchKey];
return consearchlist;
}
// if search key is not available
else{
 list<Contact> conlist = [select  ID,Name, Phone,accountId from Contact where accountid=:accId  ];
   // null check
   if(!conlist.isempty()){
      return conlist;
   }
   return null;
  }
}
    
    @AuraEnabled
    public static void deleteContacts(list<Id> lstConIds){
        try {
            list<Contact> lstConsToDelete = new list<Contact>();
            for(Id idCon : lstConIds) {
                lstConsToDelete.add(new Contact(Id = idCon));
            }
            if(!lstConsToDelete.isEmpty()) {
                delete lstConsToDelete;
            }
        }
        catch(Exception ex) {
            throw new AuraHandledException(ex.getMessage());
        }
    }

}