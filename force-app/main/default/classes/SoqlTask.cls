public class SoqlTask {
    public static void Task1(){
        list<H__c> hRecord = [SELECT Id,D__r.B__r.A__c FROM H__c where Id =: 'a0n5g00000EQsqHAAT'];
        //System.debug('hRecord==>'+hRecord);
        set<id>lsset=new set<id>();
        for(H__c hobj:hRecord){
            lsset.add(hobj.D__r.B__r.A__c);
            System.debug(lsset);
        }
        list<C__c> CRecord=[Select Id from C__c where A__c in :lsset]; 
        System.debug(CRecord);
        
    } 
    
        public static void Task2(){
            list<G__c> ls=[select Id,F__c from G__c where F__c = 'a0m5g000004zvoZAAQ'];
            System.debug(ls);
        }
    
    
    public static void taskduplicate(){
        List<F__c> LsFrecord=[select Id,(select Id,Name From Gs__r)From F__c where Id ='a0m5g000004zvoZAAQ'];
        System.debug(LsFrecord);
    }
    
    public static void task3(){
        list<I__c> Iresc=[select Id,G__r.E__r.B__r.A__c from I__c where Id ='a0p5g000002TmcEAAS'];
        Set<Id>lsset=new set<Id>();
        for(I__c irc:Iresc){
           lsset.add(irc.G__r.E__r.B__r.A__c); 
            System.debug(lsset);
        }
    }
    public static void Task4(){
       List<G__c>gRecords=[Select Id,F__c,E__c From G__C where Id=: 'a0o5g000002FTBPAA4'];
        System.debug('E and f records are'+gRecords);
        
        G__c Gobj =[Select Id,(select Id,H__r.Name from Is__r) from G__c where Id ='a0o5g000002FTBPAA4'];
        for(I__c Iobj: Gobj.Is__r){
            System.debug('Hrecord is===>'+Iobj.Id);
            System.debug('Hrecord is===>'+Iobj.H__r.Name);
           
        }
    
    }
    
    Public static void taskdemo4(){
        List<I__c>grecord=[select Id,G__r.E__c,G__r.F__c,H__c from I__c where Id =:'a0o5g000002FTBPAA4'];
       
        System.debug(grecord);
        
        
    }
   
        
    public static void task5(){
    list<H__c> hRecord = [SELECT Id,D__r.B__c FROM H__c where Id =: 'a0n5g00000EQsqHAAT'];
        //System.debug('hRecord==>'+hRecord);
        set<id>lsset=new set<id>();
        for(H__c hobj:hRecord){
            lsset.add(hobj.D__r.B__c);
            System.debug(lsset);
        }
        list<E__c> eRecord=[Select Id from E__c where B__c in :lsset]; 
        System.debug(eRecord);
    }

}