/**
 * Author: Sávio Viana
 */
public virtual class SendProjectService {

    @future(callout=true)
    public static void sendProject (String projectId) {
        Project__c project = new ProjectRepository().findById(projectId);

        HttpResponse response = sendRequest('https://run.mocky.io/v3/e61d7a35-d227-49e5-b5e5-7e0e2fdcee2d', 
                                            'PUT', 
                                            JSON.serialize( new ProjectTransformer().toEnterpriseProject(project) ) );

    
        Map<String,Object> payload = (Map<String,Object>)  JSON.deserializeUntyped( response.getBody().replace('"externalId"', ',"externalId"') );

        if (response.getStatusCode() <> 200) {
            new ProjectRepository().updateIntegrationFail( project, (String) payload.get('errorMessage') ) ;
            return;
        }

        new ProjectRepository().updateIntegrationSuccess(project);
    }

    private static HttpResponse sendRequest(String endPoint, String httpMethod, String body) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint( endPoint );
        request.setMethod(httpMethod);
        request.setHeader('Content-Type', 'application/json');
        request.setBody( body );

        Http http = new Http();
        return http.send(request);
    }

}