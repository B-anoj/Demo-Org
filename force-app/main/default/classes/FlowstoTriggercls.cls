public class FlowstoTriggercls {
    public static void Meth1(List<Contact>NewList){
        set<Id> setOfContactrec = new set<Id>();
        for(Contact con:NewList){
            if(con.AccountId != null){
            setOfContactrec.add(con.AccountId);
            }
        }
        List<Account> StoreRelatedcononAccount =[Select Id,Email__c,(select Id,Email from Contacts) 
                                                 from account where Id In:setOfContactrec];
        for(Account acc:StoreRelatedcononAccount){
            for(Contact con:acc.contacts){
                if(con.Email !=null && con.Email !=''){
                    acc.Email__c = con.Email;
                }
            }
            update StoreRelatedcononAccount;
        }
    }
    public static void Mapmeth(List<Contact>NewList,Map<Id,Contact>OldMap){
        List<Account> ListofAccounttobeupdate=New List<Account>();
        for(Contact con: NewList){
            if(OldMap != null && con.Email != OldMap.get(con.Id).Email){
                Account acc=new account();
                acc.Email__c=con.Email;
                 acc.Id=con.AccountId;  
                ListofAccounttobeupdate.add(acc);
            }
        }
        if(ListofAccounttobeupdate != null){
        update ListofAccounttobeupdate;
        }
    }
    
    //Whenever Account is created, create a contact under that Account.
    Public static void Metho2(List<Account>NewList){
        List<Contact> Contactlist = new list<Contact>();
        for(Account acc:NewList){
            Contact con=new Contact();
            con.Id=acc.Id;
            con.Lastname=acc.Name;
            Contactlist.add(con);
        }
        Insert Contactlist;
    }
    
    //Whenever Contact is created, check if it's email is null or not. 
    //If email is not NULL, send an email to that email id.
    public static void task3(List<contact>NewList){
       list<Messaging.SingleEmailMessage> ListEOfEmail = new list<Messaging.SingleEmailMessage>();
        For(Contact con:NewList){
            List<Contact> contactlist=[select Id,LastName,Email from Contact Where Id =: con.Id];
            if(con.Email != Null && con.Email != ''){
                Messaging.SingleEmailMessage Storesingleemail = new Messaging.SingleEmailMessage();
                List<String> ListofEmail = new list<String>();
                ListofEmail.add(con.Email);
                Storesingleemail.setToAddresses(ListofEmail);
                Storesingleemail.setReplyTo('support@icicibank.com');
                Storesingleemail.setSenderDisplayName('ICICI Bank Customer Support Center');
                Storesingleemail.setSubject('New Contact Created');
                Storesingleemail.setHtmlBody('Contact is Created'+con.LastName);
                
                ListEOfEmail.add(Storesingleemail);
                Messaging.sendEmail(ListEOfEmail);
        }
    }
  }
    
    //Create a currency field called Credit on Account. 
   //Whenever Opportunity's amount is getting changed, 
   //Credit on Account should be changed with (Credit - Amount)
   
    Public static void OppAmountchange(List<Opportunity>NewList,Map<Id,Opportunity>OldMap){
        for(Opportunity opp : NewList){
        if(opp.Amount != null){
             if(opp.Amount != OldMap.get(opp.Id).Amount){
                Account acc =new Account();
                acc.Id=opp.AccountId;
                
            }
           }
        }
    }
}