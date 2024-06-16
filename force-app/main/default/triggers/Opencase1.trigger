trigger Opencase1 on EmailMessage (after insert,before insert){
    EmailMessage[] emailMessages = Trigger.new;
    String emailLoop1 = Label.EmailLoopProtection ;
    //String emailLoop2 = System.Label.EmailLoopProtection2;
    //system.debug(emailLoop1);
    /** Added by Exafort(vishnu) 
    *  Purpose - To restrict case comments with subject  Delivery delayed: 
    *  */
    if (Trigger.isBefore && Trigger.isInsert)
    {
        for (EmailMessage emailMessage : emailMessages){
            if(emailMessage.subject != null && (
                emailMessage.subject.containsIgnoreCase('Delivery delayed:New case comment notification.') || 
                emailMessage.subject.containsIgnoreCase('Delivery delayed:') )){
                    emailMessage.addError('Out-of-office type subjects are not allowed to create new case comments.');
                }
        }
    }
    if (Trigger.isAfter && Trigger.isInsert)
    {
        for(EmailMessage emailMessage : emailMessages){
            Boolean rejectSubject = emailMessage.subject != null &&(emailMessage.subject.containsIgnoreCase('Out of office ') ||emailMessage.subject.containsIgnoreCase('OOO') ||emailMessage.subject.containsIgnoreCase('out of the office') ||emailMessage.subject.containsIgnoreCase('PTO')||emailMessage.subject.containsIgnoreCase('Auto Reply' )||emailMessage.subject.containsIgnoreCase('Auto Response')||emailMessage.subject.containsIgnoreCase('[Auto-Reply]')||emailMessage.subject.containsIgnoreCase('[Out of office]')||emailMessage.subject.containsIgnoreCase('Out-of-office')||emailMessage.subject.containsIgnoreCase('auto-response') ||emailMessage.subject.containsIgnoreCase('[Out-of-office]') ||emailMessage.subject.containsIgnoreCase('autoresponse RE')||emailMessage.subject.containsIgnoreCase('autoreply') ||emailMessage.subject.containsIgnoreCase('autoresponse')||emailMessage.subject.containsIgnoreCase('vacation')||emailMessage.subject.containsIgnoreCase('auto response')||emailMessage.subject.containsIgnoreCase('Out of Office' )||emailMessage.subject.containsIgnoreCase('Automatic reply') || emailMessage.subject.containsIgnoreCase('[알림] 휴가로 인한 부재') ||emailMessage.subject.containsIgnoreCase('Delivery delayed:New case comment notification.') ||emailMessage.subject.containsIgnoreCase('Delivery delayed:') ||emailMessage.subject.containsIgnoreCase('Undeliverable')||emailMessage.subject.containsIgnoreCase(Label.EmailLoopProtection)||emailMessage.subject.containsIgnoreCase('['+Label.EmailLoopProtection+']'));
            Boolean rejectSurvey = !emailMessage.incoming && (emailMessage.fromaddress != null && emailMessage.fromaddress.containsIgnoreCase('donotreply')) && ((emailMessage.HtmlBody != null && emailMessage.HtmlBody.containsIgnoreCase('clicktools.com'))  ||(emailMessage.TextBody != null && emailMessage.TextBody.containsIgnoreCase('clicktools.com')));
            Boolean rejectUndeliverable = false;
            if (emailMessage.subject != null){
                Pattern patternUndeliverable = Pattern.compile('(?i).?undeliverable.');
                Matcher matcherUndeliverable = patternUndeliverable.matcher(emailMessage.subject);
                rejectUndeliverable  = matcherUndeliverable.matches();
            }
            /** Added by Exafort(Azar) 
            *  Purpose - To assign case to corressponding queue based on support provider 
            *  */
            List<Group> qs = [select id,name From Group where Type='queue' and (name ='Support Queue - General' or name = 'Support Queue - TSC' or name = 'Support Queue - H3C' or name = 'Support Queue - NCV' or name = 'Support Queue - Automatic' or name = 'Support Queue - SSaaS' or name = 'Tech Hub Queue - SDOE' or name = 'Support Queue - InfoSight Portal')];
            Map<string, id> queueMap = new Map<string, id>();
            for(Group gr : qs){
                queueMap.put(gr.Name, gr.id);
            }
            /* End of getting query to assign queue */
            if (!rejectSubject && !rejectSurvey && !rejectUndeliverable){
                List<Case> cases = [SELECT Status,OwnerId from Case where Id = :emailMessage.ParentId];        
                if(!cases.isEmpty()){
                    Case aCase = cases[0];
                    if (aCase.Status == 'Closed' && emailMessage.Incoming == true){
                        //caseUtility.VALIDATE_OWNER_TRIGGER = false;
                        aCase.Status = 'Open';
                        update aCase;
                    }
                }            
            }        
        }
    }}