/**
 * @author Sean Lee
 * @date 2021-08-16
 * @description This class is used for deleting Logs on a monthly basis.
 * @revisions Sean Lee 2021-12-13 Restructure the scheduler to include a batch for deleting.
 */
public with sharing class LogDeletionScheduler implements Schedulable {
    /**
     * @description This is the main method of this scheduler.
     * @param objSC the scheduler context
     */
    public void execute(SchedulableContext objSC) {
        run();
    }
    /**
     * @description This method can be invoked by Flows or the scheduler itself to instantiate a batch job.
     */
    @InvocableMethod(Label='LogDeletionScheduler.run()' Description='Logs deleting scheduler.')
    public static void run() {
        Database.executeBatch(new LogDeletionBatch(), 200);
    }
}