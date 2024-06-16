trigger UpdateAccountAssetDateTrigger on Asset (after update) {
    Set<Id> accountIds = new Set<Id>();

    for (Asset asset : Trigger.new) {
        if (asset.UsageEndDate != null && Trigger.oldMap.containsKey(asset.Id) &&
            (asset.UsageEndDate != Trigger.oldMap.get(asset.Id).UsageEndDate ||
             asset.InstallDate != Trigger.oldMap.get(asset.Id).InstallDate)) {
            
            accountIds.add(asset.AccountId);
        }
    }

    if (!accountIds.isEmpty()) {
        List<Account> accountsToUpdate = [SELECT Id, Asset_Minimum_Expiration_Date__c
                                         FROM Account
                                         WHERE Id IN :accountIds];

        for (Account acc : accountsToUpdate) {
            Date minInstallDate = null;
            Date minUsageEndDate = null;

            for (Asset asset : [SELECT UsageEndDate, InstallDate
                                 FROM Asset
                                 WHERE AccountId = :acc.Id
                                 AND UsageEndDate != null]) {

                if (minInstallDate == null || asset.InstallDate < minInstallDate) {
                    minInstallDate = asset.InstallDate;
                }

                if (minUsageEndDate == null || asset.UsageEndDate < minUsageEndDate) {
                    minUsageEndDate = asset.UsageEndDate;
                }
            }

            if (minUsageEndDate != null && minInstallDate != null &&
                (minUsageEndDate != acc.Asset_Minimum_Expiration_Date__c ||
                 minInstallDate != acc.Asset_Minimum_Expiration_Date__c)) {

                acc.Asset_Minimum_Expiration_Date__c = minUsageEndDate < minInstallDate ? minUsageEndDate : minInstallDate;
            }
        }

        update accountsToUpdate;
    }
}