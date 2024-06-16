trigger Accounttri on Account (before insert) {
    AccounttriHandler.updaterating(trigger.new);

}