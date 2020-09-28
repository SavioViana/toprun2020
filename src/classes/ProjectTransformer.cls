/**
 * @author ercarval
 */
public class ProjectTransformer {

    public Project__c toProject ( AgileProject agileProject ) {

        return new Project__c ( ProjectName__c = agileProject.name
            , StartDate__c = agileProject.startDate
            , EndDate__c = agileProject.endDate
            , ExternalId__c = agileProject.externalId
        );

    }
    
    public EnterpriseProject toEnterpriseProject ( Project__c project ) {

        EnterpriseProject enterpriseProject = new EnterpriseProject();
        
        enterpriseProject.code = project.Name;
        enterpriseProject.name = project.ProjectName__c;
        enterpriseProject.status = project.Status__c;
        enterpriseProject.startDate = project.StartDate__c;
        enterpriseProject.endDate = project.EndDate__c;
        enterpriseProject.budget = project.Budget__c;

        return enterpriseProject;

    }

}