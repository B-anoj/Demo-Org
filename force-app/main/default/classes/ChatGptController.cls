public class ChatGptController {
   /* private static String Endpoint= 'https://api.openai.com/v1/chat/completions';
    public static void getChatGptResult(String searchTerm){
        String searchQueryEscape = (searchTerm).trim();
        HttpRequest request=new HttpRequest();
        request.setEndpoint(Endpoint);
        //+System.Label.Chat_Gpt_API_Key
        request.setHeader('Authorization','Bearer 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');
        request.setHeader('Content-Type','application/json');
        request.setTimeout(120000);
        String reqBody = '{"model" : "text-davinci-003","prompt":"'+searchQueryEscape+'","max_tokens":4000,"temperature":0,"stream":false,"top_p":0.5}';
        System.debug('Body====>'+reqBody);
        request.setBody(reqBody);
        request.setMethod('POST');
        Http http=new Http();
        HttpResponse resp= http.send(request);
        System.debug('---result gpt---'+resp);
        if(resp.getStatusCode()==200){
            System.debug('result===>'+resp.getBody());
        }
        
        
        

    }*/

}