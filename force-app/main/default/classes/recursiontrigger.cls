public class recursiontrigger {
    public static boolean flag=true;
    public static void recursive (LIST<contact>NewList){
        
        list<contact>ConListUpdate= new List<Contact>();
        for(contact c :NewList ){
           contact con = new contact();
            con.lastName=c.name;
            ConListUpdate.add(con);  
       
        }
         insert ConListUpdate;
             system.debug(ConListUpdate);
    } 
   
}