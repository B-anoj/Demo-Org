trigger AccountUpdate on Account (before insert) {
    list<Account> acc=([select id,name,rating,annualrevenue,industry from account where rating='hot']);
    for(Account ac:acc)
    {
        ac.name='banoj';
        ac.industry='Finance';
        update ac;
       System.debug('updated the account obj'+ac);
    }
        System.debug('the final o/p is'+acc);
    
}