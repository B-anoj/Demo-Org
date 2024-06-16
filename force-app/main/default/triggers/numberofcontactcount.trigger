trigger numberofcontactcount on Contact (after insert,after update) {
    numberofcontactcounthandler.countmeth(trigger.new);
}