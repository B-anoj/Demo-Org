trigger TR3011eg4contactEmailphone on Contact (before insert,before update){
    list <Contact> lscon=trigger.new;
    TR3011ContactEmailphone.ContactEmailphone(lscon);
}