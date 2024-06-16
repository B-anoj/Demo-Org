//Create the object called “Books” and create the field “Price”(data type is Currency) under this object.
// Whenever we enter some amount of money in the Price field and once we click on save button,
// the value we entered in the Price field is 10% less than the actual price.
// This is applicable for while both inserting and updating records.
trigger BookTrigger on Book__c (before insert,before update) {
    for(Book__c bk:Trigger.new){
        bk.Price__c = bk.Price__c * (1 - 0.10);
    }
}