trigger accountexample on Account (before insert) {
    
    if(trigger.isinsert && trigger.isbefore){
        list<account>lsaccount=trigger.new;
        for(account acc:lsaccount){
            
            if(acc.Phone==null||acc.Phone==''){
                acc.Phone.adderror('Please Enter the Phone Number');
            }
        }
        
    }
    
    

}