public class patientTrigger 
{
     public static void CountPatientOnDr(list<patient__c>NewList)
    {
        set<id>DrIdSet= new set <Id>();
        for(patient__c p : NewList)
        {
            DrIdSet.add(p.Doctor__c);
        }
        List<Doctor__c>DoctorList= [select id,Number_Of_Patient__c,(select id from patients__r) from Doctor__c where id in :DrIdSet ];
        for(Doctor__c d:DoctorList ){
            d.Number_Of_Patient__c=d.patients__r.size();
            
        }
        update DoctorList;
    }
    public static void DoctorCount(List<Doctor__c>NewList)
    {
        set <Id>DepartmentIdSet= new Set <id>();
        set<id>DrIdSet= new set <Id>();

        list <Doctor__c> drList= new List<Doctor__c>();
        for(Doctor__c p : NewList)
        {
            DrIdSet.add(p.Id);
            DepartmentIdSet.add(p.Department__c);
        }
        list<Department__c>DepList= [select id,Number_Of_Doctor__c,TotalPatient__c,(select id ,Number_Of_Patient__c from Doctors__r ) from Department__c
                                     where id  in:DepartmentIdSet];
        
        List<Doctor__c>DoctorList= [select id,(select id from patients__r) from Doctor__c where id in :DrIdSet ];

        
        for(Department__c d: DepList){
        for(Doctor__c dp:DoctorList ){
            d.Number_Of_Doctor__c=d.Doctors__r.size();
            d.TotalPatient__c=dp.patients__r.size();
           }
        }
        
        update DepList;
        update DoctorList;

    }    
    
}