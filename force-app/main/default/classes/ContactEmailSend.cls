//Write a trigger on Contact , when a contact insert an email should be sent to contact email id with specified template. 
//So first you need to create text template. Template Design is below.
public class ContactEmailSend {
    public static void emailSend(List<contact>NewList){
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
                System.debug(ListEOfEmail);
            }
            System.debug(con);
        }
        
    }
    //Write a trigger on contact to prevent duplicate records based on Contact Email & Contact Phone.
    public static void preventDuplication(List<Contact>NewList){
        List<String> StringofName = New List<String>();
        List<String> StringofEmail =New List<String>();
        for(Contact con: NewList){
             // if(OldMap !=null && con.Name != OldMap.get(con.Id).Name && con.Email != OldMap.get(con.Id).Phone)
            StringofName.add(con.Name);
            StringofEmail.add(con.Email);
            list<Contact> Updatecontact=[select id,Name,Email from Contact where Name in :StringofName AND Email in : StringofEmail];
            for(Contact con1:NewList){
               // con1.AddError('Contact Already Existing in same name and Email');
            }
        }
    }
    //Write a trigger, only system admin user should be able to delete the task.
    public static void SystemAdminDeleteTask(List<Task> OldList) {
        Id profileId = UserInfo.getProfileId();
        Profile profileName = [SELECT Id, Name FROM Profile WHERE Id = :profileId];
        
        for (Task taskObj : OldList) {
            if (profileName.Name != 'System Administrator') {
                taskObj.addError('Only System Administrator can delete records');
            }
        }
    }
  //Write a trigger on Account , when an account insert , 
  //automatically account billing address should populate into the account shipping address.
  
    public static void AccountShippingtoBillingadd(List<Account>NewList){
        Map<Id,Account> AccounttoUpdate = new Map<Id,Account>();
        For(Account acc1:NewList){
            acc1.ShippingStreet=acc1.BillingStreet;
            acc1.ShippingStreet=acc1.BillingStreet;
            acc1.ShippingCity=acc1.BillingCity;
            acc1.ShippingState=acc1.BillingState; 
            insert acc1;
        }
    } 
    //Write a trigger on Opportunity, when an Opportunity will be insert an Opportunity Line Item should be insert 
    //by default with any of the Product associated with Opportunity. Ask me if you need help ?
     
    Public static void opportunityLineItemInsert(List<Opportunity> NewList){
        List<OpportunityLineItem> opportunityLineItemList = New List<OpportunityLineItem>();
        for(Opportunity opp:NewList){
            OpportunityLineItem opl = New OpportunityLineItem();
            opl.OpportunityId=opp.Id;
           // opl.Quantity = opp.TotalOpportunityQuantity;
            opl.Product2Id='01u5g000006YToYAAW';
            opl.Quantity=2;
            opl.PricebookEntryId='01t5g0000085u8EAAQ';
            opl.TotalPrice=2000;
            
            opportunityLineItemList.add(opl);
        }
        if(opportunityLineItemList.Size() > 0){
        Insert opportunityLineItemList;
        }
    }
    
    
    //Create a duplicate lead when a lead in insert.
   
    
        public static void createDuplicateLead(List<Lead> newList) {
    List<Lead> DuplicateLeads = new List<Lead>();
    
    for (Lead le : newList) {
        if (!(le.LastName).contains('DuplicateLeads')) { 
            Lead duplicateLead = new Lead();
            duplicateLead.FirstName = le.FirstName;
            duplicateLead.LastName = le.LastName;
            duplicateLead.Company = le.Company;
            DuplicateLeads.add(duplicateLead);
        }
    }

    if (!DuplicateLeads.isEmpty()) { 
        insert DuplicateLeads;
    }
}

    
    //Write a trigger on Account when Account is update check all opportunity inside the account. 
    //Update all Opportunities Stage to close lost ,
    //if an opportunity created date is greater than 30 days from today and stage not equal to close won.
    
    public static void AccountUpdate(List<Account>NewList){
        Set<Id> AccountId= new set<Id>();
        for(account acc:NewList){
            AccountId.add(acc.Id);
        }
        DateTime day30=system.now()-30;
        List<Opportunity> OppToUpdate=new List<Opportunity>();
        List<Opportunity> OppList = [select Id,AccountId,StageName,CreatedDate,CloseDate From 
                                     Opportunity where AccountId in : AccountId];
        if(OppList.size()>0){
        for(Opportunity opp:OppList){
            if(opp.createdDate > day30) {  // && opp.StageName != 'ClossedWon')
                opp.StageName = 'Closed Lost';
                opp.closeDate = System.today();
              OppToUpdate.add(opp);  
            }
        }
            if(OppToUpdate.size()>0){
                update OppToUpdate;
            }
      } 
    }
    
    //Create an asset when create an OpportunityLineItem with associated Account.
   /* public static void createAssetWhenOpLI(List<OpportunityLineItem>NewList){
        set<Id> OpplineItem = new Set<Id>();
        for(OpportunityLineItem opplt : NewList){
            	OpplineItem.add(opplt.OpportunityId);
        }
      List<Asset> ListAsset= New List<Asset>();
      List<Opportunity> ListOpp= [Select Id,AccountID,Account.Name From Opportunity where Id IN : OpplineItem];
        if(ListOpp.size() > 0){
            For(Opportunity opp: ListOpp){
                Asset assetobj=New Asset();
                assetobj.AccountID=opp.AccountId;
                assetobj.Name =opp.Account.Name ;//+ 'OpportunityLineItem';
                ListAsset.add(assetobj);
            }
       }
        if(ListAsset.Size()>0){
            Insert ListAsset;
        }
    } */
         //Create a field on Account Named (Client Contact lookup to Contact)
         // Once an account insert a contact will create with the name of account 
        // and that contact will be the client contact on Account.
        
    Public static void ClientContact(List<Account>NewList){
        List<Contact> ContactList = New List<Contact>();
        for(Account acc : NewList){
            Contact con = New Contact();
            con.AccountId=acc.Id;
            con.Phone=acc.phone;
            Con.LastName=acc.Name;
            ContactList.add(con);
        }
        insert ContactList;
        
        Account acc = new Account();
        acc.id = ContactList[0].AccountId;
        acc.Client_Contact__c = ContactList[0].id;
        update acc;    
    }
    
    //OpportunityLineItem	When an opportunity line item create an email should go to Opportunity Account
	//Client Contact -- Client Contact would be a fields on Account lookup to contact.
	//Email Template:Hi, Conact Name
	//Your Order has been proceed.
	//Order detail is below.
	//Product Name
	//Product Code
	//Unit Price
	//List Price
	//Discount
	//Thanks
	//User First Name User Last Name.
	
    public static void sendEmailToOppAccEmail(List<OpportunityLineItem> oppLineItemList){
        Set<Id> oppIds = new Set<Id>();
        for(OpportunityLineItem oppLineItems:oppLineItemList){
            oppIds.add(oppLineItems.OpportunityId);
        }
        //List<Opportunity> oppList = [select id,name,Account.Client_Contact_r.LastName,Account.Client_Contact_r.Email from Opportunity WHERE Id IN: oppIds];
        // List<OpportunityLineItem> oliItem = [select product2.name,product2.ProductCode,OpportunityId, Opportunity.Account.Client_Contact__r.Email,
        //    Opportunity.Account.Client_Contact__r.LastName, UnitPrice, ListPrice, Discount 
        //    from OpportunityLineItem where OpportunityId IN: oppIds];
        
        List<OpportunityLineItem> oliItem = [select id,name,product2.name,ProductCode,UnitPrice,ListPrice,
                                             Discount, OpportunityId, Opportunity.Account.Client_Contact__r.Lastname,
                                             Opportunity.Account.Client_Contact__r.Email from OpportunityLineItem 
                                             where OpportunityId IN: oppIds];
        
        
        List<Messaging.SingleEmailMessage> emailList= new List<Messaging.SingleEmailMessage>();
        emailTemplate emlTmp = [select id,subject,Description,Htmlvalue,Developername,Body 
                                from emailTemplate where name = 'OpportunityLineItem Email Template'];
          Id userId = UserInfo.getUserId();
        User uu = [select id,firstName,Lastname from user where Id =: userId LIMIT 1];

        //Email template body
        for(OpportunityLineItem oppLineItems:oliItem){
            
            if( oppLineItems.Opportunity.Account.Client_Contact__r.Email!= null){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setTargetObjectId(uu.id);
                mail.setSenderDisplayName('System Administrator'); 
                mail.setSaveAsActivity(false);
                mail.setTemplateID(emlTmp.Id);
                //
                mail.setSubject('New Opportunity Product was Created.');
                String body = 'Dear '+oppLineItems.Opportunity.Account.Client_Contact__r.Lastname+',<br/>';
                body += 'Your Order has been proceed.<br/>';
                body +='Order detail is below.<br/>';
                body +='Product Name : '+oppLineItems.Name+'.<br/>';
                body +='Product Code : '+oppLineItems.ProductCode+'.<br/>';
                body +='Unit Price : '+oppLineItems.UnitPrice+'.<br/>';
                body +='List Price : '+oppLineItems.ListPrice+'.<br/>';
                body +='Thanks <br/>'+uu.Lastname;
                mail.setHtmlBody(body);
                
                
                mail.toaddresses = new string[]{oppLineItems.Opportunity.Account.Client_Contact__r.Email};
                    emailList.add(mail);
            }
        }
        if(emailList.size()>0){
            Messaging.SendEmailResult[] results = Messaging.sendEmail(emailList);
            if (results[0].success)
            {
                System.debug('The email was sent successfully.');
            } else {
                System.debug('The email failed to send: '+ results[0].errors[0].message);
            }
        }
    }

    //Once an account an email should go to the admin user with specified text below.
    //An account has been created and name is "Account Name".
    
        Public static void  AccountEmailSent(List<Account>NewList){
            List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
            User userObj=[select Id,Profile.Name,Email from user where Profile.Name='System Administrator'];
            for(Account acc:NewList){
                if(userObj.Email!=null){
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setSenderDisplayName('Welcome to Salesforce World!!');
                    mail.setUseSignature(false);
                    mail.setBccSender(false);
                    mail.setSaveAsActivity(false);
                    mail.toAddresses = new String[]{userObj.Email};
                        mail.setSubject('New Account was Created.');
                    String body = 'Dear System Administrator, <br/>';
                    body += 'An account has been created and name is '+acc.Name+'.';
                    mail.setHtmlBody(body);
                    mails.add(mail);
                }
            }
            //Checking if the list of mails is not empty
            if(mails.size()>0){
                
                Messaging.SendEmailResult[] results = Messaging.sendEmail(mails);
                
                if (results[0].success)
                {
                    System.debug('The email was sent successfully.');
                } else {
                    System.debug('The email failed to send: '+ results[0].errors[0].message);
                }
            }
        } 
    //Once an opportunity line item will create update Opportunity's Account with the total number of Product Quantities.
    //Create a field first on Account "Total sales quantities".
    Public static void ProductQuantity(List<OpportunityLineItem>NewList){
        set<Id> OppId = new set<Id>();
        set<Id> accId= new set<Id>();
        
        for(OpportunityLineItem opl : NewList){
           OppId.add(opl.OpportunityId);
        }
         Decimal quantityvalue = 0;
        list<OpportunityLineItem> listofOpplineItem = [select Id,Opportunity.AccountId,Quantity From OpportunityLineItem 
                                                       Where Id in: OppId];
        for(OpportunityLineItem oplineitem : listofOpplineItem){
            quantityvalue = quantityvalue + oplineitem.Quantity;
            accId.add(oplineitem.Opportunity.AccountId);
        }
        list<Account> Accountlist = [select Id,Total_sales_quantities__c from Account where Id in : accId];
        for(Account acc : Accountlist){
            account ac = new account();
            ac.id = acc.Id;
            quantityvalue = ac.Total_sales_quantities__c;
        }
        update Accountlist; 
    }  
    //Once an account will update then that Account will update with the total amount from All Opportunities on Account level.
    //Account field name would be Total Opportunity Amount.
    public static void Totalopp(List<Account>NewList,Map<Id,Account>OldMap){
        set<Id> AccId =new set<Id>();
        for(Account acc : NewList){
           AccId.add(acc.Id); 
        }
        Decimal sumofValue1=0;
        Map<Id,Decimal> mapOfAccountIdOppamount = new  Map<Id,Decimal>();
       // List<Opportunity> oppList = [SELECT id,name,Amount,AccountId from Opportunity where AccountId IN:AccId];
        for(Opportunity opp : [SELECT id,name,Amount,AccountId from Opportunity where AccountId IN:AccId]){
            sumofValue1 += opp.Amount;
            mapOfAccountIdOppamount.put(opp.AccountId,sumofValue1);
        }
        
       // Decimal sumofValue=0;
      //  List<Account> AccountList = [select Id,Total_Opportunity_Amount__c,
                                   //  (Select Id,Amount from opportunities) from Account where Id in : AccId];
        For(Account ac: [SELECT Id,name,Total_Opportunity_Amount__c from Account where id IN:mapOfAccountIdOppamount.keyset()]){
            Account acc = new account();
            acc.id = ac.id;
            acc.Total_Opportunity_Amount__c = mapOfAccountIdOppamount.get(acc.id);
           // ac.Total_Opportunity_Amount__c = sumofValue;
        }
       // update AccountList;
    }
    
    // Account will update with the total amount from All Opportunities on Account level.
    //Account field name would be Total Opportunity Amount.
    
    public static void Totalopp(List<opportunity>NewList){
    set<id> lsset=new set<id>();
    for(opportunity opp : NewList){
        lsset.add(opp.AccountId);
    }
    list<account> lsaccupdate=[select id,sumoftotalopportunityamountvalue__c,(Select id,amount from opportunities) 
                              from account where id in :lsset];
    System.debug('update account list is'+lsaccupdate);
    decimal amountval=0;
    for(account acc:lsaccupdate){
        for(opportunity opps:acc.opportunities){
            amountval += opps.Amount;
            system.debug('opportunity value is'+opps);
        }
        System.debug('2nd update account list is'+acc);
        acc.sumoftotalopportunityamountvalue__c=amountval;
    }
    update lsaccupdate;
 }

    
    //Once an Opportunity line item will create insert a quotation also
    Public static void oplinsertquoteinsert(List<OpportunityLineItem>NewList){
        system.debug('NewList===' +NewList);
        set<Id> OppId= new set<Id>();
        List<string> proName = new List<string>();
        for(OpportunityLineItem opp : NewList){
            OppId.add(opp.OpportunityId);
            proName.add(opp.Name);
        }
        system.debug('proName===' +proName);
        List<Quote> quotelist = new list<Quote>();
        list<Opportunity> opplist = [Select Id,Name from opportunity where Id In : OppId];
        if(opplist.size()>0){
            for(Opportunity opp : opplist){
                Quote qt =new quote();
                qt.OpportunityId = opp.Id;
                qt.Name=proName[0];
                quotelist.add(qt);
            }
            insert quotelist;
        }
    }
        
        //Write a trigger on Opportunitylineitem when a lineitem deletes, delete an opportuntiy as well.
    public static void Oplidelete(List<OpportunityLineItem>OldList){
        set<Id> OppId= new set<Id>();
        for(OpportunityLineItem opl : OldList){
            OppId.add(opl.OpportunityId);
        }
        List<Opportunity> listopportunity=[select id,Name from Opportunity where Id IN : OppId];
        if(listopportunity.size()>0){
            delete listopportunity;
        }
    }
    //When an account BillingCity is update , update all contacts MailingCity with account BillingCity.
    
    public static void accbillingcityupdatetocon(List<Account>NewList){
        List<Contact> contdata = new List<Contact>();
        set<Id> AccId = New Set<Id>();
        for(Account acc:NewList){
            if(acc.BillingCity != null)// && acc.BillingCity != Trigger.OldMap.get(acc.Id).BillingCity){
                AccId.add(acc.Id);
            
        }
        List<Contact> ContactList = [Select Id,AccountId,MailingCity,Account.BillingCity 
                                     from Contact Where AccountId In :AccId];
        if(ContactList.size()>0){
        for(Contact con : ContactList){
            if(con.MailingCity!=con.Account.BillingCity){
                con.MailingCity=con.Account.BillingCity;
                contdata.add(con);
        }
      }
   }
        if(contdata.size() > 0){
        update contdata;
        }
    } 
    //Create a field on Account and Opportunity -- Minimum And Max Date ,
    //Once an Opportunity is delete,insert,update Update Account Min And Max Date from the All Opportunity.
    
    public static void oppdelete(List<Opportunity>NewList){
        set<Id> AccId = new set<Id>();
        for(Opportunity opp:NewList){
            AccId.add(opp.AccountId);
        }
        List<Account> accList = new List<Account>();
        List<AggregateResult> minDate = [select MIN(Minimum__c) minOpDate from Opportunity where AccountId IN:AccId];
        List<AggregateResult> maxDate = [select MAX(Maximum__c) maxOpDate from Opportunity where AccountId IN:AccId];
        
        for(Opportunity opp:NewList){
            if(opp.Minimum__c != null && opp.Maximum__c != null){
                Account acc = new Account();
                acc.Id = opp.AccountId;
                acc.Minimum__c = (Date)minDate[0].get('minOpDate');
                acc.Maximum__c = (Date)maxDate[0].get('maxOpDate');
                accList.add(acc);
            }
        }
        if(!accList.isEmpty()){
            update accList;
        } 
    }
    
   //Create a fields on Opportunity Client Contact,
   // Once an Opportunity client Contact update then update Account client contact with same on Opportunity Client Contact.
    public static void updateAccountClientContact(List<Opportunity> newList) {
        Set<Id> accountIds = new Set<Id>();
        
        for (Opportunity opp : newList) {
            accountIds.add(opp.AccountId);
        }
        
        List<Account> accountList = [SELECT Id, Client_Contact__c, 
                                     (SELECT Id, Client_Contact__c FROM Opportunities) 
                                     FROM Account WHERE Id IN :accountIds];
        
        for (Account acc : accountList) {
            for (Opportunity opp : acc.Opportunities) {
                if (opp.Client_Contact__c != null) {
                    acc.Client_Contact__c = opp.Client_Contact__c;
                    break; 
                }
            }
        }
        
        update accountList;
    }

    //Write a trigger on Opportunity when Opportunity Stage Change 
    //send email to Client contacts of Opportunity Account that your Opportunity Stage has been change.
    //Subject: Account Update Info.
    //Body : Your account information has been updated successfully.
    
   
    public static void sendEmailsOnStageChange(List<Opportunity> newList, Map<Id, Opportunity> oldMap) {
        Set<Id> accountIds = new Set<Id>();

        for (Opportunity opp : newList) {
            Opportunity oldOpp = oldMap.get(opp.Id);

            if (opp.StageName != oldOpp.StageName && opp.AccountId != null) {
                accountIds.add(opp.AccountId);
            }
        }

        if (!accountIds.isEmpty()) {
            Map<Id, List<Id>> accountContactsMap = new Map<Id, List<Id>>();

            for (Contact con : [SELECT Id, AccountId FROM Contact WHERE AccountId IN :accountIds]) {
                if (!accountContactsMap.containsKey(con.AccountId)) {
                    accountContactsMap.put(con.AccountId, new List<Id>());
                }
                accountContactsMap.get(con.AccountId).add(con.Id);
            }

            List<Messaging.SingleEmailMessage> emailsToSend = new List<Messaging.SingleEmailMessage>();

            for (Opportunity opp : newList) {
                if (accountContactsMap.containsKey(opp.AccountId)) {
                    List<Id> contactIds = accountContactsMap.get(opp.AccountId);

                    for (Id conId : contactIds) {
                        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                        mail.setTargetObjectId(conId);
                        mail.setSubject('Account Update Info');
                        mail.setPlainTextBody('Your account information has been updated successfully.');
                        emailsToSend.add(mail);
                    }
                }
            }

            if (!emailsToSend.isEmpty()) {
                Messaging.sendEmail(emailsToSend);
            }
        }
 }
       
    //Write a trigger on Account when account type change send email 
    //to all contacts that your account information has been change.
    //Subject: Account Update Info Body : Your account information has been updated successfully. Account Name : XYZ.
    
    public static void sendEmailtoContact(List<Account>NewList,Map<Id,Account>OldMap){
        set<Id> AccId =new set<Id>();
         List<Messaging.SingleEmailMessage> emailsToSend = new List<Messaging.SingleEmailMessage>();
        List<String> sendTo = new List<String>();
        for(Account acc: NewList){
            if (acc.Type != oldMap.get(acc.Id).Type && acc.Type != null){
            AccId.add(acc.Id);
                System.debug('AccId is'+AccId);
            }
        }
        List<Contact> LisofContact =[select Id,AccountId,FirstName,Email,Account.Name from Contact where AccountId In : AccId];
        if(!LisofContact.IsEmpty()){
        for(Contact con : LisofContact){
            if(string.isNotBlank(con.Email)){
             if (String.isNotBlank(con.Email)) {
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setSenderDisplayName('Email Alert');
                mail.setSubject('Account Update Info');
                String body = 'Your account information has been updated successfully,Account Name: ' + con.Account.Name;
                mail.setToAddresses(new List<String>{con.Email});
                mail.setHtmlBody(body);
                emailsToSend.add(mail);
             }
            }
        
       }
        
    }
}
    //Once a Account update, all Opportunities line item list should be copy is account assets with the same products
    public static void AccounttoAssetCopy(List<Account>NewList){
        Set<Id> AccId =New Set<Id>();
        for(Account acc : NewList){
        AccId.add(acc.id);
    }
       // list<Opportunity> OpportunityList =[Select Id,Name,(select Id,Name from Opportunities) from Account where Id in :AccId];
  }
    
    //Write a trigger on Asset Once An asset is insert into Account,
    // an Opportunity and one Opportunity line item also create with respect to Account.
    public static void assertisInsert(List<Asset>NewList){
        list<Opportunity> opplist =new List<opportunity>();
        list<OpportunitylineItem> listofOpplineItem = new list<OpportunitylineItem>();
        Set<id> SetofAccouId = new set<Id>();
        for(Asset asst : NewList){
            SetofAccouId.Add(asst.AccountId);
        }
        list<Account> Listofacc =[select Id,Name from account where Id in : SetofAccouId];
        for(Account acc:Listofacc){
            //OpportuntityLineItem opl =new OpportuntityLineItem();
            Opportunity opp = new Opportunity();
            opp.AccountId = acc.Id;
            opp.StageName= 'closedWon';
            opp.CloseDate=System.Today();
            //opp.AccountId.OpportunityId = acc.Id;
            opp.Name=acc.Name;
            opplist.add(opp);
        }
        insert opplist;
        for(opportunity opps:opplist){
        OpportunityLineItem opl = new OpportunityLineItem();
            opl.OpportunityId=opps.Id;
            opl.Product2Id='01u5g000006YToYAAW';
            opl.Quantity=2;
            opl.PricebookEntryId='01t5g0000085u8EAAQ';
            opl.TotalPrice=2000;
            listofOpplineItem.add(opl);
        }
        insert listofOpplineItem;
        
    } 
    
    //Add a filed Multi select Picklist on Account And Opportunity as well and add values A,B,C,D,F
    //Now if we update an Opportunity with this multiselect value Account should also update with same picklist values.
    
    public static void selectmultipickvalue(List<Opportunity>NewList,Map<Id,Opportunity>OldMap){
        set<Id> AccId = new set<Id>();
        Map<Id,String> Pickvalue = new Map<Id,String>();
        for(Opportunity opp: NewList){
            if(opp.Multiselectpickvalue__c != OldMap.get(opp.Id).Multiselectpickvalue__c){
                if(opp.AccountId != null){
                    AccId.add(opp.AccountId);
                }
                list<Account> lsacc = new list<Account>();
                list<Account>Acclist=[select Id,SelectMultipickvalue__c from Account Where Id in :AccId];
                if(Acclist.size()>0){
                    for(Account acc:Acclist){
                         pickValue.put(acc.Id, acc.SelectMultipickvalue__c);
                    }
                    for(Opportunity opps :NewList){
                        if (opp.AccountId != null && pickValue.containsKey(opp.AccountId)) {
                            opp.Multiselectpickvalue__c = pickValue.get(opp.AccountId);
                        }
                    }
                }
                update lsacc;
            }
        }
    }
    //Create a fields on Account (Asset Minimum Expiration Date)
    //Check the UsageEndDate on Asset and populate on Account Level Field if Asset Install Date  are different
   
    public static void updateAccountAssetDate(List<Asset> newList, Map<Id, Asset> oldMap) {
        Set<Id> accountIds = new Set<Id>();

        for (Asset asset : newList) {
            if (asset.UsageEndDate != null && oldMap.containsKey(asset.Id) &&
                (asset.UsageEndDate != oldMap.get(asset.Id).UsageEndDate ||
                 asset.InstallDate != oldMap.get(asset.Id).InstallDate)) {
                
                accountIds.add(asset.AccountId);
            }
        }

        if (!accountIds.isEmpty()) {
            List<Account> accountsToUpdate = [SELECT Id, Asset_Minimum_Expiration_Date__c
                                              FROM Account
                                              WHERE Id IN :accountIds];

            for (Account acc : accountsToUpdate) {
                Date minInstallDate = null;
                Date minUsageEndDate = null;

                for (Asset asset : [SELECT UsageEndDate, InstallDate
                                     FROM Asset
                                     WHERE AccountId = :acc.Id
                                     AND UsageEndDate != null]) {

                    if (minInstallDate == null || asset.InstallDate < minInstallDate) {
                        minInstallDate = asset.InstallDate;
                    }

                    if (minUsageEndDate == null || asset.UsageEndDate < minUsageEndDate) {
                        minUsageEndDate = asset.UsageEndDate;
                    }
                }

                if (minUsageEndDate != null && minInstallDate != null &&
                    (minUsageEndDate != acc.Asset_Minimum_Expiration_Date__c ||
                     minInstallDate != acc.Asset_Minimum_Expiration_Date__c)) {

                    acc.Asset_Minimum_Expiration_Date__c = minUsageEndDate < minInstallDate ? minUsageEndDate : minInstallDate;
                }
            }

            update accountsToUpdate;
        }
    }

    

   /* public static void createAsset(List<OpportunityLineItem>newList){
        set<Id> idsOfOpp = new set<Id>();
        Map<Id,List<OpportunityLineItem>> alloppLineitems = new Map<Id,List<OpportunityLineItem>>();
        Map<Id,List<Opportunity>>alloppitems = new Map<Id,List<Opportunity>>();
        for(OpportunityLineItem olp : newList){
            idsOfOpp.add(olp.OpportunityId);
        }
        for(OpportunityLineItem oli :newList){
            if(!alloppLineitems.containsKey(oli.OpportunityId)){
                alloppLineitems.put(oli.OpportunityId,new List<OpportunityLineItem>());
            }
            alloppLineitems.get(oli.OpportunityId).add(oli);
        }
        List<Opportunity> allOpportunities = [select id,AccountId from Opportunity where Id IN:alloppLineitems.Keyset()];
        for(Opportunity opp:allOpportunities){
            if(!alloppitems.containsKey(opp.AccountId)){
                alloppitems.put(opp.AccountId,new List<Opportunity>());
            }
            alloppitems.get(opp.AccountId).add(opp);
        }
        List<Asset> allAssets = new List<Asset>();
        for(Id accountId : alloppitems.keyset()){
            for(Opportunity opp : alloppitems.get(accountId)){
                for(OpportunityLineItem oli :alloppLineitems.get(opp.Id)){
                    Asset ass = new Asset();
                    ass.AccountId = opp.AccountId;
                	ass.Product2Id = oli.Product2Id;
                	ass.Name = oli.Name;
                    ass.Price = oli.UnitPrice;
                    ass.Quantity = oli.Quantity; 
                    ass.Description = oli.Description;
                	allAssets.add(ass);
                }
				
            }
        }
        if(!allAssets.isEmpty()){
            insert allAssets;
        }
    }*/
    
    //Create a field on Opportunity (Serial No (Text)) and populate increment values once an Opportunity Line Item Add
    //Let say if we add 3 product then sequence would be 1,2 ,3 , Now if we delete 2 
    //and again add one more product this msut be 4 irrespective of deleted seqeunce number.
    
 /* public static void OpportunitylineIteminc(List<OpportunityLineItem>NewList){
        set<Id> OppId = new set<Id>();
        list<Opportunity> opportunitylist =new list<Opportunity>();
        for(OpportunityLineItem opl:NewList){
            OppId.add(opl.OpportunityId);
        }
        decimal count=0;
        List<Opportunity> OppMap =[select Id,SerialNo__c,(select Id,Name from OpportunityLineItems)
                                           from Opportunity where Id in : OppId];
             
        for(opportunity Opps : OppMap){
            //for(OpportunityLineItem opl: OppMap.get(OppsID).OpportunityLineItem){
               //count += String.ValueOf(opps.SerialNo__c);
               //count += opps.SerialNo__c;
               count ++;
               opps.SerialNo__c = String.Valueof(count);
               opportunitylist.add(Opps);
            }
        Update opportunitylist;
        } */
    
    
    //Opportunity Line Item	Once Opportunity Line Item is added to Opportunity 
    //with the specified product,Then Product Total Quantities must be deduct from the Product Object
	//e.g. If we have Total Quantity 100 on Product object and we have added 50 in line items , 
	//then product must be update 100-50 = 50
	//Create Total Quantity, Available Quantity Fields on Product2 object.

    
    public static void countofAccount(List<Account>NewList,List<Account>OldList){
        set<Id> OwnersIds = new set<Id>();
        for(Account acc : NewList){
            OwnersIds.add(acc.OwnerId);
        }
        list<User> userList = [select Id,Name,Count__c from user where Id in: OwnersIds];
        Integer getAccount = [select count() from Account where OwnerId  in : OwnersIds];
        System.debug('count:::: ' +getAccount);
        for(User us : userList){
            us.count__c = getAccount;
        }
        update userList;
    }
    
    Public static void ProductItemdeduct(List<OpportunityLineItem >NewList){
        Set<Id> proId = new Set<Id>();
        for(OpportunityLineItem oppProd: NewList){
            proId.add(oppProd.Product2Id);
        }
        Map<Id,Double> proIdQuantitySum =new Map<Id,Double>();
        List<AggregateResult> results=[select Product2Id,sum(Quantity)quantity from
                                       OpportunityLineItem where Product2Id in :proId group by Product2Id];
        if(results.size()>0){
            for(AggregateResult a: results){
                Id prodId = (Id)a.get('Product2Id');
                double TotalQuantity = (double)a.get('quantity');
                proIdQuantitySum.put(prodId,TotalQuantity);
            }
        }
        List<Product2> proListToUpdate = new List<Product2>();
        List<Product2> proList=[Select Id,Total_Quantity__c from Product2 where Id=:proId];
        if(proList.size()>0){
            for(Product2 pro : proList){
                if(proIdQuantitySum.containsKey(pro.Id)){
                    if(pro.Total_Quantity__c!=null){
                        pro.Total_Quantity__c = pro.Total_Quantity__c-proIdQuantitySum.get(pro.Id);
                        proListToUpdate.add(pro);
                    }
                }
            }
        }
        if(proListToUpdate.size()>0){
            update proListToUpdate;
        }
    }
    
    /*Once a user is updated an email should go to his Manager’s email Id,
with the total number of Account Owned by him,
You have assigned a number of accounts and Account Contains a Number of Contacts
Like
Subject: Your Accounts and Number of Related Contacts
Body: Dear User,
You have assigned a number of accounts and Account Contains the Number of Contacts.
Total Accounts = 3
A – 10 (i.e Account Name – Total number of Contacts)
B – 10
C – 10  */
    
    Public static void sendMailToManagerOnUpdate(List<User>NewList){
        String UId;
        String MngId;
        for(User u : NewList){
            if(u.ManagerId != Null){
                MngId = u.ManagerId;
                UId = u.Id;
            }
        }
        List<Messaging.SingleEmailMessage> emailList= new List<Messaging.SingleEmailMessage>();
        List<Account> accList =[Select Id,Name,OwnerId,(Select Id from Contacts) from Account where OwnerId=:uId];
        if(accList.size()>0){
            Integer noOfAccounts =accList.size();
            if(mngId!=null){
                User mngObj=[Select Id,Email from User where Id=:mngId];
                if(mngObj.Email!=null){
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setSenderDisplayName('Salesforce Manager');
                    mail.setUseSignature(false);
                    mail.setBccSender(false);
                    mail.setSaveAsActivity(false);
                    mail.toAddresses = new String[]{mngObj.Email};
                        mail.setSubject('Accounts and Number of Related Contacts');
                    String body = 'Dear User, <br/>';
                    body += 'You have assigned number of account and Account Contains Number of Contacts.<br/>';
                    body += 'Total Accounts = '+noOfAccounts;
                    for(Account accObj : accList){
                        body += '<br/>'+accObj.Name+' = '+accObj.Contacts.size();
                    }
                    mail.setHtmlBody(body);
                    emailList.add(mail);
                }
            }  
        }
    }
    
    //Product2	Write a trigger on Opportunity line item , Add two picklist values in Product Family field
	//Electronic and Books And a picklist Product type on Opportunity with same picklist values
	//Now once you add a line item into Opportunity, check 
	//if Opportunity Product Type is same as opli Product Family let it be insert or add error The Product family does not match.
	
    public static void opplineItem(List<OpportunityLineItem>NewList){
        map<id,string> mapofoli=new map<id,string>();
        set<id> oppids=new set<id>();
        for(opportunitylineitem oli : NewList){
            if(oli.OpportunityId!=null){
                mapofoli.put(oli.OpportunityId,oli.Product_Family__c);
                oppids.add(oli.OpportunityId);
            }
            list<opportunity> opplist=[select id,Product_Type__c from opportunity where id In:oppids];
            for(opportunity opp:opplist){
                If(oli.Product_Family__c != opp.Product_Type__c){
                    oli.Product_Family__c.adderror(' The Product family does not match.');
                }
            }
        
    }
 }
}