/**
 * @author Sean Lee
 * @date 2021-12-13
 * @description This batch is used to split Logs into batches to handle.
 */
@SuppressWarnings('PMD.EmptyStatementBlock')
public with sharing class LogDeletionBatch implements Database.Batchable<SObject> {
    public Database.QueryLocator start(Database.BatchableContext objBC) {
        return Database.getQueryLocator([SELECT Id FROM Log__c]);
    }
    public void execute(Database.BatchableContext objBC, List<Log__c> lstLog) {
        System.enqueueJob(new LogDeletionQueue(lstLog));
    }
    public void finish(Database.BatchableContext objBC) {
    }
}