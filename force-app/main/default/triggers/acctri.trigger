trigger acctri on Account (before insert) {
    for(account acc:trigger.new){
        if(acc.rating == 'hot')
        {
        acc.description='hot description'; 
        }
    }
   
   

}