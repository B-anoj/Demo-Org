public class databaseclass {
    public static void dmltest(){
        list<account> lsinsertacc=new list<account>();
        for(integer i=0;i<50;i++){
        account a=new account();
        a.name='demo'+i;
            if(i==40){
                a.name='';
            }
        lsinsertacc.add(a);    
        }
      //database.insert(lsinsertacc,false);
      //system.debug('Size'+lsinsertacc.size());
        
        if(! lsinsertacc.isEmpty())
            {
                 Database.SaveResult[] results = Database.insert(lsinsertacc, false);

                for(Database.SaveResult res : results)
                {
                    if(res.isSuccess())
                    {
                        System.debug('Record has been Inserted Successfully.');
                        System.debug('Account Record Id is....: '+ res.getId());
                    }
                    else
                    {
                           Database.Error[] errors = res.getErrors(); 

                        for(Database.Error err : errors)
                        {
                            System.debug('Error Message is.....: '+ err.getMessage());
                            System.debug('Error Status Code is....: '+ err.getStatusCode());
                            System.debug('Affected Fields are.....: '+ err.getFields());
                        }
                    }

                    System.debug('-----------------------------------');
                }
            }

    }
        

}