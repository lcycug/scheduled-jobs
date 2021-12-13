/**
 * @author Sean Lee
 * @date 2021-08-16
 * @description This is the test class of
 */
@IsTest
private class LogDeletionSchedulerTest {
    @TestSetup
    static void init() {
        Test.startTest();
        List<Log__c> lstLog = new List<Log__c>();
        for (Integer intI = 0; intI < 100; intI++) {
            lstLog.add(new Log__c());
        }
        insert lstLog;
        Test.stopTest();
    }
    @IsTest
    static void testDeletingLogs() {
        Test.startTest();
        System.assert([SELECT COUNT() FROM Log__c LIMIT 200] == 100);
        System.schedule('test', '0 0 12 1 * ?', new LogDeletionScheduler());
        Test.stopTest();
        System.assert([SELECT COUNT() FROM Log__c LIMIT 200] == 0);
    }
}