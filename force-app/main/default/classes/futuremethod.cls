public class futuremethod {
    Public static void DoDMLOperations()
    {
        
        	User userDeactivate = [Select id, firstName, lastName, userName, isActive from User
                                    							Where userName = 'insightssecurity@00d5g00000ip1uueaj.com'];
        
        	if(userDeactivate.id != Null)
            {
                userDeactivate.IsActive = false;
                
                Update userDeactivate;
                
                // Call the Method to Insert an Account..
                CreateAccountRecord();
            }
    }
    
    @future(callout = true)
    Public static void CreateAccountRecord()
    {
         
        	Account acc = new Account();
        		acc.Name = 'Test Account';
        		acc.Rating = 'Hot';
        		acc.Industry = 'Technology';
        		acc.AnnualRevenue = 4000000;
        		acc.Phone = '9900337788';
        		acc.Fax = '9900993344';
        		acc.Website = 'www.gmail.com';
        		acc.Type = 'Customer - Direct';
        		acc.Ownership = 'Public';
        		acc.BillingCity = 'Bangalore';
        		acc.BillingState = 'Karnataka';
        		acc.BillingCountry = 'India';
        		acc.CustomerPriority__c = 'High';
        		acc.Active__c = 'Yes';
        
        	Insert acc;
        	if(acc.Id != Null)
                System.debug('Account Record Inserted Successfully with ID ...: '+ acc.Id);
    }

}