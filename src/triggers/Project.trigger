/**
 * Author: Sávio Viana
 */
trigger Project on Project__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    new ProjectTH().run();
}