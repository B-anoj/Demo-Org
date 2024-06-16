public class DmlOperation {
    public static void DmlMethod(){
        list<Account>acclist=new list<Account>();
        acclist=[select id,name,accountnumber from Account where name like 'Acc3%' and accountnumber='123'];
    }

}