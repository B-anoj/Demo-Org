public class VastRecord {
    public static void mainmeth(){
        list<Contact> conlist = new List<Contact>();
        for(Integer i=0;i<25000;i++){
            Contact con =new Contact();
            con.LastName = 'Alexa'+ i;
            conlist.add(con);
        }
        insert conlist;
    }

}