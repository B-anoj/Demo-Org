public class Email_SingleEmail
{
    public void sendEmail()
    {
        // step 1----->initialize/call the messaging namespace
        messaging.SingleEmailMessage Sem=new  messaging.SingleEmailMessage(); 
        
        //step 2------>prepare the data
        list<string> toadd=new list<string>{'samalbanoj253@gmail.com','banoj.samal@pinnacleo.com'};
            list<string> ccadd=new list<string>{'chandanlp007@gmail.com'};
                
                //step 3---->compose the mail
                sem.setToAddresses(toadd);
        sem.setCcAddresses(ccadd);
        sem.setSubject('Welcome to singlemessage email world');
        sem.setPlainTextBody('welcome to world,people are waiting for you');
        
        //step4------->send email
        list<Messaging.Email> sndemail=new list<Messaging.Email>{Sem};
            Messaging.sendEmail(sndemail);
        
    }
    
}