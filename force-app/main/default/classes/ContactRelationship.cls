public class ContactRelationship {
    public static void conMethod(list<Contact>NewList){
        set<Id> Listset =New set<Id>();
        for(Contact con:NewList){
            Listset.add(con.OwnerId);
        }
        List<User> ListOfUser = [SELECT Id, Name FROM User Where Id in: Listset];
        for(Contact con:NewList){
        for(User us: ListOfUser){
            con.Contact_Relationship_Name__c = us.Name;
        }
    }
  }
}