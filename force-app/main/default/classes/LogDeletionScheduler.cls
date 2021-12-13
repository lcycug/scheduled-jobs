/**
 * @author Sean Lee
 * @date 2021-08-16
 * @description This class is used for deleting Logs on a monthly basis.
 */
public with sharing class LogDeletionScheduler implements Schedulable {
    public void execute(SchedulableContext objSC) {
        delete [SELECT Id FROM Log__c ORDER BY CreatedDate ASC LIMIT 10000];
    }
}