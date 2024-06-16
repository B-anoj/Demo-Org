public class forloop2 {
    public static void formeth(){
        list<contact> conlist= new list<contact>();
        for(Integer i=0;i<20;i++)
        {
            contact con=new contact();
            con.lastname='ac'+i;
            conlist.add(con);
            
        }
        insert conlist;
        
    }
}