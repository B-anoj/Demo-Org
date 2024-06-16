trigger rating on Account (before insert) {
    if(trigger.isinsert || trigger.isbefore){
        for(Account acc:trigger.new){
            if(acc.rating=='cold')
            {
                acc.description='change to world';
            }
        }
    }

}