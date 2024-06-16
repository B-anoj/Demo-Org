//When ever Lead is created with LeadSource as Web then give rating as cold otherwise hot.
public class leadwebclass {
    public static void LeadMeth(List<Lead>NewList){
        for(lead ld:NewList){
            if(ld.LeadSource=='Web'){
                ld.rating='cold';
            }
            else{
                ld.rating='hot';
            }
        }
    }

}