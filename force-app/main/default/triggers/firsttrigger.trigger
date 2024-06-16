trigger firsttrigger on Account (before insert) {
    if(trigger.isinsert && trigger.isbefore){
        for(account acc:trigger.new){
            if(acc.name==null || acc.name=='')
                acc.addError('the name is mandatory field');
            else if(acc.phone==null || acc.phone==''){
                acc.addError('phone is mandatory field');
            }
        }
    }

}