//	Objective: Use Scheduled Apex to trigger a Queueable job 
//	that escalates Cases if they are open for more than 7 days.
//	Details: The Scheduled job runs daily, triggering a Queueable job that 
//  checks and updates the 'Status' field of Case records to 'Escalated'.
//	Key Learning: Combining Scheduled and Queueable Apex, date calculations.


public class Quabledemo7 implements Queueable{
    public void execute(QueueableContext context) {
        Date sevenDaysBefore = Date.today().addDays(-7);

        List<Case> ListOfcases = [SELECT Id, Status, CreatedDate From Case Where 
                                      Status != 'Escalated' AND CreatedDate <= :sevenDaysBefore];

        List<Case> casesToUpdate = new List<Case>();
        for (Case c : ListOfcases) {
            c.Status = 'Escalated';
            casesToUpdate.add(c);
            System.debug('Case Updatedrecord are===>'+casesToUpdate);
        }

        if (!casesToUpdate.isEmpty()) {
            update casesToUpdate;
            System.debug(casesToUpdate.size() + ' cases escalated.');
            System.debug('Case Updatedrecord are===>'+casesToUpdate);
        } else {
            System.debug('No cases found for escalation.');
        }
    }
}