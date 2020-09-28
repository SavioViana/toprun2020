/**
 * 
 */
public virtual with sharing class ProjectRepository {

    virtual
    public Project__c create (Project__c project) {

        insert project;
        return project;

    }

    virtual
    public List<Project__c> create (List<Project__c> projects) {
 
        insert projects;
        return projects;

    }


    public Project__c findById (String id) {
        
        List<Project__c> projects = findByIds ( new List<String> { id } );

        return !projects.isEmpty() ? projects.get(0) : null;

    }

    public List<Project__c> findByIds (List<String> ids) {
        return [ SELECT Id, StartDate__c, EndDate__c
            , ProjectName__c, ExternalId__c, Name
            , Status__c,  Type__c, Budget__c
            FROM Project__c 
            WHERE Id in :ids ];
    }

    public Project__c updateIntegrationSuccess( Project__c project ) {
        project.LastSyncDate__c = Datetime.now();
        project.SynchronizationStatus__c = 'Integrado com sucesso'; 
        update project;
        return project;
    }
    
    public Project__c updateIntegrationFail( Project__c project, String errorMessage ) {
        project.SynchronizationStatus__c = 'Erro na sincronização de projetos';
        project.ErrorMessage__c = errorMessage; 
        update project;
        return project;
    }

}