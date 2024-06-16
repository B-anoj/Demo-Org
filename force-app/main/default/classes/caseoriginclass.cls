//When ever a case is created with origin as email then set status as new and Priority as Medium.
public class caseoriginclass {
    public static void casemethod(list<Case>NewList){
        for(case cs:NewList){
            if(cs.origin=='Email'){
                cs.status='New';
                cs.priority='Medium';
            }
            
        }
        
        
    }

}