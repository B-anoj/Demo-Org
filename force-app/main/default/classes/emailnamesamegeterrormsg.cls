public class emailnamesamegeterrormsg {
   public string phone;
   public string name;
    public void m1(string name){
        if([select id,name,phone from account where name=:name].size()>1)
        {
            System.debug('record is already exist');
        }
        else{
            Account acc=new account();
            acc.name='avinash';
            insert acc;
            //acc.addError('duplicate account can not be created');
            System.debug(acc);
        }
    }
}