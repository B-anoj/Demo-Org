public class SalesfocetoGoogleDriveintegration {
    public static void makeCallout() {
        HttpRequest request = new HttpRequest();
        request.setMethod('REST API METHOD');
        //request.setMethod('GET');
        //request.setEndpoint('callout:GoogleDrive/' + path);
        request.setEndpoint('callout:GoogleDrive' + '/users/me/calendarList');
        
        Http http = new Http();
        HTTPResponse response = http.send(request);
        
        if (response.getStatusCode() == 200) {
            System.debug(response.getBody());
        }
    }
    
}