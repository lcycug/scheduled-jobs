/**
 * @author Sean Lee
 * @date 2021-12-16
 * @description This queueable is used to delete Logs.
 */
public with sharing class LogDeletionQueueable implements Queueable {
    private List<Log__c> lstLog;
    /**
     * @description This constructor receives a list of Logs to delete.
     * @param lstLog a list of Logs
     */
    public LogDeletionQueueable(List<Log__c> lstLog) {
        this.lstLog = lstLog;
    }
    /**
     * @description This is the main method to delete Logs.
     * @param objQC the queueable context
     */
    public void execute(QueueableContext objQC) {
        if (this.lstLog == null || this.lstLog.isEmpty()) {
            return;
        }
        delete this.lstLog;
    }
}