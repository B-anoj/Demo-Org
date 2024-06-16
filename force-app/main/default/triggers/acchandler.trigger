trigger acchandler on Account (before insert) {
     handleracc.accmeth(trigger.new);
}