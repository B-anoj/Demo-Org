//Write a trigger on Task,only the system admin should be able to delete the task.

trigger casenotdeletebyadminonly on Case (before delete) {
    Id currentUserprofileId=userInfo.getProfileId();
    profile systemAdminprofileId=[select Id,name from profile where Id=:currentUserprofileId];
    for(case lscase:trigger.old)
    {
        if(systemAdminprofileId.name !='System Administrator'){
            lscase.addError('you can not delete record, Go away');
        }
    }

}