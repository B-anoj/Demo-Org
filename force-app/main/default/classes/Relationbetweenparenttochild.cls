public class Relationbetweenparenttochild {
    public static void method1(){
        List<Contact> listofcontact = [Select ID,FirstName,Phone,Account.Phone From Contact Where AccountId != null limit 2];
        if(listofcontact != null){
            for(Contact con : listofcontact){
                con.phone = con.Account.phone;
            }
        }
        if(listofcontact != null){
         update listofcontact;
        }
    }

}