trigger preventduplication1 on Account (before insert) {
    preventduplicatecls.meth(trigger.new);
}