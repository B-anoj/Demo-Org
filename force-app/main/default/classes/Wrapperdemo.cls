public class Wrapperdemo {
    public static void callwrapper(){
        list<Wrappercls> lsWrapper =new List<Wrappercls>();
        Wrappercls wrapobj = new Wrappercls();
        wrapobj.x=45;
        wrapobj.y='Rohit Sharma';
        lsWrapper.add(wrapobj);
        System.debug('Wrapper record is'+lsWrapper);
    }
    public class Wrappercls{
        public integer x;
        public string Y;
    }
    
    public static void wrapperdemo2(){
        list<wrap> lswarp = new list<Wrap>();
       
        List<Account> acc =[select id,Name,(Select Id,Name from contacts) from Account limit2];
        for(Account lsacc: acc){
            for(Contact con: lsacc.Contacts){
                wrap wp = new wrap();
                wp.AccName = lsacc.Name;
                wp.ConFirstName = lsacc.Name;
                lswarp.add(wp);
            }
            System.debug('Account and contact list are :::'+lswarp);
          
    }
 }       
    public class wrap{
        public String AccName;
        public String ConFirstName;
    }
}