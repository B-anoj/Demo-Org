trigger accountindustry on Account (before insert) {
    for(Account acc:trigger.new){
        if(acc.Industry=='energy')
        {
            acc.rating='hot';
        }
    }

}