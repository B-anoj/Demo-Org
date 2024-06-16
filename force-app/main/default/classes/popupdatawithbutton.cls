public class popupdatawithbutton {
      @AuraEnabled
    public static void deletecontacts(list<Id> lstconIds){
        try {
            list<Contact> lstconToDelete = new list<Contact>();
            for(Id idcon : lstconIds) {
                lstconToDelete.add(new Contact(Id = idcon));
            }
            if(!lstconToDelete.isEmpty()) {
                delete lstconToDelete;
            }
        }
        catch(Exception ex) {
            throw new AuraHandledException(ex.getMessage());
        }
    }

 @AuraEnabled(cacheable=true)
  public static List<Contact> getContacts(string accId , String searchKey) {
// if search key is available
if(searchKey != null && searchKey !=''){
    String key = '%'+ searchKey +'%';  // search key
list<Contact> consearchlist = [SELECT ID,Name, Phone from Contact where accountid=:accId AND Name LIKE : key];
return consearchlist;
}
// if search key is not available
else{
 list<Contact> conlist = [select  ID,Name, Phone from Contact where accountid=:accId  ];
   // null check
   if(!conlist.isempty()){
      return conlist;
   }
   return null;
  }
}


}