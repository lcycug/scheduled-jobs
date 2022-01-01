/**
 * @author Sean Lee
 * @date 2021-12-13
 * @description This is the test class of LogDeletionBatch.
 */
@IsTest
private class LogDeletionBatchTest {
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
    static void testBatch() {
        System.assertEquals(100, [SELECT COUNT() FROM Log__c LIMIT 200]);
        Test.startTest();
        String strJobId = Database.executeBatch(new LogDeletionBatch());
        Test.stopTest();
        System.assertNotEquals(null, strJobId);
        System.assertEquals(0, [SELECT COUNT() FROM Log__c LIMIT 200]);
    }
}