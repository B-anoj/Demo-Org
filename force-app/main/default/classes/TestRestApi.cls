@RestResource(urlMapping='/createContactRecord')
global class TestRestApi {
    @HttpPost
    global static void sendContact(){
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        
        ContactWrapper contWrap=(ContactWrapper)JSON.deserialize(request.requestBody.toString() , ContactWrapper.class);
        if(contWrap != null){
            Contact conObj=new Contact();
            conObj.FirstName=contWrap.firstname;
            conObj.LastName=contWrap.lastname;
            conObj.AccountId=contWrap.accountId;
            if(conObj!=null){
                insert conObj;
            }
        }
    }
     global Class ContactWrapper{
        global String firstname;
        global String lastname;
        global String accountId;
    }

}