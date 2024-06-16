/*when ever a case is created with origin as email then set status as new 
 and Priority as Medium */

trigger caseoriginasemailthensetstatusnew on Case (before insert) {
   for(case cs:trigger.new)
   {
       if(cs.origin=='Email')
       {
           cs.Status='new';
           cs.priority='medium';
       }
   }
}