public class Handler {
    public static void CountPatientOnDr(list<patient__c>NewList){
        set<id>DrIdSet= new set <Id>();
        for(patient__c p : NewList){
            DrIdSet.add(p.id);
        }
        List<Doctor__c>DoctorList= [select id,Number_Of_Patient__c,(select id from patients__r) from Doctor__c where id in :DrIdSet ];
            for(Doctor__c d:DoctorList ){
                d.Number_Of_Patient__c=d.patients__r.size();            
        }
        update DoctorList;
    }

}