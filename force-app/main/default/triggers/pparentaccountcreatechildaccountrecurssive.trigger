trigger pparentaccountcreatechildaccountrecurssive on Account (after insert) {
    list<Account> listacc=new list<Account>();
    for(Account acc:trigger.new)
    {
        account childacc=new account();
        childacc.name='child account';
        childacc.id=acc.id;
        listacc.add(childacc);
    }
    insert listacc;
}