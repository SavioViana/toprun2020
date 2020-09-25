/**
 * @author: ercarval
 */
public class SearchAddressCtrl {

    @AuraEnabled(cacheable=true)
    public static ZipCodeAddress searchAddress (String zipCode) {

        GetAddressOubountService service = new GetAddressOubountService();
        
        return service.findAddress(zipCode);
    }


}