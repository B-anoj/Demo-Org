/*
Create a Trigger on Contact Object, to make the Email and Phone Fields should be Manadatory upon 
creating or updating a Contact Record.
*/
trigger CreatingandupdatingContact on Contact (before insert,before update) {
    //if(trigger.isInsert && trigger.isbefore)||(trigger.isUpdate && trigger.isbefore){
        for(contact con:trigger.new){
            if(con.Email==null || con.phone==null)
            {
                con.AddError('please enter the email and phone value');
                
            }
            System.debug('contact recors is'+con);
        
    }
}