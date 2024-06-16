//when account phone is update contact phone also update

trigger triggerdemo2 on Account (after update) {
    if(trigger.isafter || trigger.isupdate){
        triggerdemo2.metho2(trigger.new);
    }
    
}