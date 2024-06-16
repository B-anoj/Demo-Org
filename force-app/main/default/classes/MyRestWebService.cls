@RestResource(urlMapping='/createAccountRecord')
global class MyRestWebService {
    @HttpPost
    global static void sendAccountRecord(){
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        String responseJson = '[';
        List<Account>accountlist=new List<Account>();
        List<AccountWrapper> requestBody = (List<AccountWrapper>)JSON.deserialize(request.requestBody.toString() , List<AccountWrapper>.class);
        if(!requestBody.isEmpty() && requestBody.size()>0){
            for(AccountWrapper accObj: requestBody){
                Account acc = new Account();
                acc.Name = accObj.name;
                acc.Rating = accObj.rating;
                acc.Type = accObj.type; 
                accountlist.add(acc);
            }
            if(!accountlist.isEmpty() && accountlist.size()>0){
            insert accountlist;
            }
            for(Account acc:accountlist){
                responseJson += '{"record Id" :"'+acc.Id+'",';
                responseJson+='"status":"'+'success"},';
            }
            responseJson =responseJson.removeEnd(',');
            responseJson+=']';
            
            response.responseBody=Blob.valueOf(responseJson);
            response.statusCode=200;
        }
        /*single record insert
        if(requestBody != null){
            Account acc = new Account();
            acc.Name = requestBody.name;
            acc.Rating = requestBody.rating;
            acc.Type = requestBody.type;
            if(acc!=null){
                insert acc;
            }
        }
*/
    }
    global Class AccountWrapper{
        global String name;
        global String rating;
        global String type;
    }

}