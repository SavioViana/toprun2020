/**
 * Author: Sávio Viana
 */
public virtual class ProjectTH extends TriggerHandler {

    List<Project__c> newProjects;
    
    Map<Id,Project__c> oldProjects;

    AccountValidator validator;

    public ProjectTH () {
        this ( (List<Project__c>) Trigger.new, (Map<Id,Project__c>) Trigger.oldMap );
    }

    public ProjectTH (List<Project__c> newProjects , Map<Id,Project__c> oldProjects) {
        this.newProjects = newProjects;
        this.oldProjects = oldProjects;
    }


    override
    public void afterInsert() {
        sendProject();
    }
    
    override
    public void afterUpdate() {
        sendProject();
    }

    virtual
    public void sendProject () {
        for  (Project__c project : newProjects) {
            if (project.Type__c == 'Enterprise' && project.Status__c == 'Iniciado' && project.SynchronizationStatus__c != 'Integrado com sucesso') {
                SendProjectService.sendProject(project.Id);
            }
        }
    }

}