public class contactactcurdoperation {
    public static void insertRec(){
        list<Contact> lscon=new list<Contact>();
        for(Integer i=0;i<=3;i++){
        Contact con=new Contact();
            con.lastname='text'+i;
            System.debug('the contact record in one by one==>'+con);
            lscon.add(con);
        }
        insert lscon;
        System.debug('the contact record in list format===>'+lscon);
    }
    public static void deleterec(){
        list<Contact> delCon=[SELECT ID,LastName FROM Contact where LastName LIKE 's%'];
        Delete delCon;
        System.debug('The deleted record are'+delCon);
    }
    
    public static void updaterec(){
        list<Contact>lscon=new list<Contact>();
        list<Contact>updatecon=[select ID,LastName FROM Contact where LastName='text3'];
        for(Contact con:updatecon){
            con.lastname='Banoj';
            lscon.add(con);
            System.debug('the update contact is===>'+con);
        }
        update lscon;
        System.debug('the update contact list ===>'+lscon);
    }

    //upsert operation 
    public static void upsertrec(){ //Both update and insert
        list<Contact> lscon=new list<Contact>();
        list<Contact>updatels=[select ID,lastname FROM Contact where lastname like 'sonu%' Limit 2];
        for(Contact con:updatels){
            con.lastname='sonu 1234';
            lscon.add(con);
            system.debug('the update record is===>'+con);
        }
        update lscon;
        //Inserting record
       	list<Contact> lscontact=new list<Contact>();
        for(Integer i=0;i<2;i++){
            Contact con=new contact();
            con.lastname='Leo'+i;
                lscontact.add(con);
                system.debug('the update record is===>'+con);
        }
        upsert lscontact;
        System.debug('the upsert record is'+lscontact);
    }
}