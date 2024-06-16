public class Accountdatainsert {
    public static void accountmethod(String Name,String phone,String Fax){
        Account acc=new Account();
        acc.Name='Rakhshit';
        //acc.Email='samalbanoj253@gmail.com';
        acc.phone='7789051676';
        acc.fax='123';
        
        insert acc;
        //System.debug('the record is :',Name: ' + acc.Name + ', Phone: ' + acc.Phone + ', Fax: ' + acc.Faxc');
        
    }

}