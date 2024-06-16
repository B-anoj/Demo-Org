global class LeadupBatch implements Database.Batchable<sObject>
{
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator([select id,name,annualrevenue from lead]);
    }
    global void execute(Database.BatchableContext bc, list<lead>reclist)
    {
        for(lead ls:reclist)
        {
            ls.annualrevenue=100000;
        }
        update reclist;
    }
    global void finish(Database.BatchableContext bc)
    {
        messaging.singleemailmessage mail=new messaging.singleemailmessage();
        string[] toAddress=new string[]{'samalbanoj253@gmail.com','banoj.samalpinnacleo.com'};
        mail.setToAddresses(toAddress);
        mail.setSubject('Batch job completed');
        Messaging.sendEmail(new messaging.singleemailmessage[]{mail});
    }

}