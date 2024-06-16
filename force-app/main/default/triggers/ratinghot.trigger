trigger ratinghot on Account (before insert) {
    for(account acc:trigger.new)
    if(acc.rating=='hot')
    {
        acc.description='welcome to apex world';
    }
    
    for(account acc:trigger.new){
        acc.rating='hot';
    }
}