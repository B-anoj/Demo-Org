public class Soqltest {
    //Id of 'H' object record you need to find record of 'C'
    public static void Task1(){
        Set<id>lsset=new Set<id>();
        list<H__c> hRecord = [SELECT Id, Name,D__r.Id,D__r.Name,D__r.B__r.Id,D__r.B__r.Name,
                              D__r.B__r.A__r.Id, D__r.B__r.A__r.Name FROM H__c];
        for(H__c hobj:hRecord){
        System.debug('iRecords___accId==>'+hobj.D__r.B__r.A__r.Id);
            lsset.add(hobj.D__r.B__r.A__r.Id);
        }
        
           //List<A__c> aRecord =[SELECT ID,Name,(SELECT Id,Name from Cs__r ) From A__c Where Id IN :lsset];
          List<C__c> aRecord =[SELECT Id,Name,A__c from C__c  Where A__c IN :lsset];
         System.debug('The Cobject Id Is'+aRecord);
    }
    public static void Task2() {
        List<I__c> iRecords = [SELECT ID,Name,G__r.iD,G__r.Name,G__r.F__r.id,
                               G__r.F__r.Name, G__r.F__r.C__r.id, G__r.F__r.C__r.Name,
                               G__r.F__r.C__r.A__r.Id From I__c];
        System.debug('iRecords___accId--->'+iRecords[0]. G__r.F__r.C__r.A__r.Id);

        // Process retrieved records or perform other actions
        System.debug(iRecords);
    }
    //Id of F-Object record is given find the record of 'G' 
    public static void Task2demo(){
        List<F__c> lsrecord=[SELECT ID,Name,(SELECT Id,Name from Gs__r) From F__c];
        for(F__c gred:lsrecord){
            System.debug(gred);
        }
    }
    //Id of 'I' is given find record od 'A'
    Public Static void Task3(){
        set<Id> Lset=New Set<Id>();
        List<I__c> aRecord =[SELECT ID,Name,G__r.iD,G__r.Name,G__r.F__r.id,
                               G__r.F__r.Name, G__r.F__r.C__r.id, G__r.F__r.C__r.Name,
                               G__r.F__r.C__r.A__r.Id From I__c];
        for(I__c irec:aRecord){
            Lset.add(irec.G__r.F__r.C__r.A__r.Id);
            System.debug('aRecords___accId--->'+Lset);
        }

    }
    //Id of 'G'is given find E,F & H.
    public static void Task4(){
        Set<Id>Lsset=new set<Id>();
        List<G__c>gRecords=[SELECT Id,Name,(Select Id,Name From Is__r),E__r.Id,E__r.Name,F__r.Name From G__C];
        System.debug('The Record Id is' +gRecords);
        //List<G__c>grecords2=[];
       
        
    }
    //Id of 'H' given find record of 'E' 
    public Static void Task5(){
        Set<Id> lsset=New Set<Id>();
        List<H__c> hRecords=[SELECT ID,Name,D__r.Id,D__r.name,D__r.B__r.Id,D__r.B__r.Name From H__c];
        for(H__c hobject : hRecords){
        lsset.add(hobject.D__r.B__r.Id);
        System.debug('hRecords___accId==>'+lsset);
        }
        List<E__c> eRecords=[select Id,Name,B__c From E__c where B__c IN : lsset];
        System.debug('eRecords Id is===>'+eRecords);
    }
   
}