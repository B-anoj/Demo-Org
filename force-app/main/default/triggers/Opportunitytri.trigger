trigger Opportunitytri on Opportunity (before insert) {
    opportunitytriHandler.method1(trigger.new);
}