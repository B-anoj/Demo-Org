public class TR3011ContactEmailphone {
    public static void ContactEmailphone(list <Contact> lscon){
        for(contact EC:lscon)
        {
            if(EC.Phone==null || EC.Email==null)
            {
                EC.Phone='99999';
                EC.Email='test@gmail.com';
            }
            
        }
    }
}