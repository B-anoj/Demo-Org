trigger accountcretopportunity on Account (after insert) {
    
    if(trigger.isinsert && trigger.isafter){
         handleopp.oppmeth(trigger.new);
    }
      
}