trigger recrssive3 on Account (before insert) {
    list<Account> lscon=new list<Account>();
    
    for(Account acc:trigger.new)
    if(recurssionclas3.executeonce==true)
    {
        account chacc=new account();
        chacc.name='Banoj';
        
        
    }
}