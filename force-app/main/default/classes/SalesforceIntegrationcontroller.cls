public class SalesforceIntegrationcontroller {
    public static void getAccessToken(){
        String endpoint='https://wise-goat-uko5f4-dev-ed.trailblaze.my.salesforce.com/services/oauth2/token';
        String methodType='POST';
        String username='r19ca613@wise-goat-uko5f4.com';
        String password='Banoj@123bfzX4dsHgKD2K68td3vtuCo4T';
        String granttype='password';
        String clientid='3MVG9fe4g9fhX0E4xyFi76Z9UfxL3BpnBwwOVc_4d62wgKkRPzHwilOjnSFdyQqdF1d0Y.HgYfXARMo9vaQgA';
        String clientsecret='5CF5C12E430F733BF9F24101A6DD592A3DAA047EE8E302A1EEB65BB892CF8092';
        
        HttpRequest httpReq = new HttpRequest();
        
        httpReq.setEndpoint(endpoint);
        httpReq.setMethod(methodType);
        httpReq.setBody(
            'username='+username+
            '&password='+password+
            '&grant_type='+granttype+
            '&client_id='+clientid+
            '&client_secret='+clientsecret
        );
        
        Http http=new Http();
        
        HttpResponse httpResp = http.send(httpReq);
        String jsonBody = httpResp.getBody();
        //deserialization
        if(httpResp.getStatusCode()==200){
        SalesforceWrapper wrapData = (SalesforceWrapper)System.JSON.deserialize(jsonBody,SalesforceWrapper.class);
            if(wrapData.access_token != null){
                getAccount(wrapData.access_token);
            }
        System.debug('Access token===>'+wrapData.access_token);
        system.debug('===>response==>'+httpResp.getBody());
        }   
    }
    public static void getAccount(String accessToken){
        String endpoint = 'https://wise-goat-uko5f4-dev-ed.trailblaze.my.salesforce.com/services/data/v55.0/query?q=SELECT+Name,id,Rating+FROM Account';
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint(endpoint);
        req.setHeader('Authorization','Bearer '+accessToken);
        Http http = new Http();
        HttpResponse resp = http.send(req);
        System.debug('==>Data===>'+req.getBody());
    }
    public class SalesforceWrapper{
        String access_token;
        public SalesforceWrapper(String access_token){
            this.access_token = access_token;
        }
    }
    
}