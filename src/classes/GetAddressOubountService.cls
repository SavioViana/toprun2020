/**
 * @author : ercarval - topi
 */
public class GetAddressOubountService {


    public ViaCepAddressResponse findAddress ( String zipCode ) {

        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://run.mocky.io/v3/5560e169-a5c2-4456-a20d-f19674456e15');
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json');

        Http http = new Http();
        HttpResponse response = http.send(request);

        String payload = response.getBody();

        System.debug('Status ---- ' + response.getStatus());
        System.debug('Status Code ' + response.getStatusCode());
        System.debug(payload);
        
        return ( ViaCepAddressResponse ) JSON.deserialize( payload , ViaCepAddressResponse.class );
    
    }


}