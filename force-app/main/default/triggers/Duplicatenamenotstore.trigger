trigger Duplicatenamenotstore on Account (before insert,before update) {
    list<string> lsacc=new list<string>();
    for(Account acc: trigger.new)
    {
        lsacc.add(acc.name); 
    }
    list<Account>updatelst=[select id,name,phone from account where name in:lsacc];
    //------------for second time insert to check duplicate or not-------------
  
    for(account acc:trigger.new)
    {
        if(trigger.isinsert)
        {
            if(updatelst.size()>0)
            {
                acc.addError('The name already exit');
            }
        }
    }
    
   //-----------For update the name
   /*for(account oldacc:trigger.old)
   {
       if(account.name!=oldacc.name && oldacc.size()>0)
       {
           
       }
   }*/ 
}