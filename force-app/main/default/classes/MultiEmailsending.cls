public class MultiEmailsending {
    public void Emailmethod(){
        Messaging.SingleEmailMessage me = new Messaging.SingleEmailMessage();
        List<contact> lscon=[select id ,FirstName,name,phone,Email from contact where phone='939393'];
        for( Contact con:lscon)
        {
            if(con!=Null){
                list<string> toadd=new list<string>{con.email};
                    
                    me.setToAddresses(toadd);
                me.setSubject('hlw welcome to world class');
                me.setplaintextbody('hiii' +con.firstname +'welcome to pinnacleo');
                
                
                list<messaging.Email> sndemail=new list<messaging.Email>{me};
                    messaging.sendEmail(sndemail);
                system.debug('mail send to=> '+toadd);
            }
        }
    }
    
}