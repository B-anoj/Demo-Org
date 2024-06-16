trigger sumofopponacctrg on Opportunity (after insert) {
    if(trigger.isInsert || trigger.isafter){
        sumofoppvaluonacc.sumoppmeth(Trigger.new);
    }

}