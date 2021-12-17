/**
 * @author Sean Lee
 * @date 2021-12-16
 * @description This is the test class of LogDeletionQueue.
 */
@IsTest
private class LogDeletionQueueTest {
    @IsTest
    static void testNull() {
        Test.startTest();
        insert new Log__c();
        System.assertEquals(1, [SELECT COUNT() FROM Log__c LIMIT 10]);
        Id idJob = System.enqueueJob(new LogDeletionQueue(null));
        Test.stopTest();
        System.assertNotEquals(null, idJob);
        System.assertEquals(1, [SELECT COUNT() FROM Log__c LIMIT 10]);
    }
    @IsTest
    static void testEmptyList() {
        Test.startTest();
        insert new Log__c();
        System.assertEquals(1, [SELECT COUNT() FROM Log__c LIMIT 10]);
        Id idJob = System.enqueueJob(new LogDeletionQueue(new List<Log__c>()));
        Test.stopTest();
        System.assertNotEquals(null, idJob);
        System.assertEquals(1, [SELECT COUNT() FROM Log__c LIMIT 10]);
    }
    @IsTest
    static void testLogDeletion() {
        Test.startTest();
        Log__c objLog = new Log__c();
        insert objLog;
        System.assertEquals(1, [SELECT COUNT() FROM Log__c LIMIT 10]);
        Id idJob = System.enqueueJob(new LogDeletionQueue(new List<Log__c>{ objLog }));
        Test.stopTest();
        System.assertNotEquals(null, idJob);
        System.assertEquals(0, [SELECT COUNT() FROM Log__c LIMIT 10]);
    }
}