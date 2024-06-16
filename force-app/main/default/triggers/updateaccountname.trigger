trigger updateaccountname on Account (before update) {
    list<account> acc=new list<account>();
    for(account acc:trigger.new){
        acc.name='Dr.'+' ' +acc.name;
    }
    update acc;

}