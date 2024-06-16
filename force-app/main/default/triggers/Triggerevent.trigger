trigger Triggerevent on Account (before insert,after insert,before update,after update) {
    
    if(trigger.isBefore && trigger.isInsert)
    {
        System.debug('----this will fire only on before insert');
        System.debug('tgigger new version of record');
        System.debug('Trigger.new-->'+trigger.new);
        System.debug('tgigger old version of record');
        System.debug('Trigger.old-->'+trigger.old);
        
    }
    if(trigger.isafter && trigger.isinsert){
        System.debug('----this will fire only of after insert');
        System.debug('tgigger new version of record');
        System.debug('Trigger.new-->'+trigger.new);
        System.debug('tgigger old version of record');
        System.debug('Trigger.old-->'+trigger.old);
        
    }
    if(trigger.isbefore && trigger.isupdate){
        {
            System.debug('----this will fire only on before update');
            System.debug('Trigger.new-->'+trigger.new);
            System.debug('Trigger.newMap-->'+trigger.newMap);
            System.debug('Trigger.old-->'+trigger.old);
            System.debug('Trigger.oldMap-->'+trigger.oldMap);  
        }
        if(trigger.isAfter && trigger.isUpdate)
        {
            System.debug('----this will fire only on after update');
            System.debug('Trigger.new-->'+trigger.new);
            System.debug('Trigger.old-->'+trigger.old);        
        }
        
    }
    
}