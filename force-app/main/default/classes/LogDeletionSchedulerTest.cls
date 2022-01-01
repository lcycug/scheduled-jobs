/**
 * @author Sean Lee
 * @date 2021-08-16
 * @description This is the test class of
 */
@IsTest
private class LogDeletionSchedulerTest {
    @IsTest
    static void testDeletingLogs() {
        Test.startTest();
        String strJobId = System.schedule('test', '0 0 12 1 * ?', new LogDeletionScheduler());
        Test.stopTest();
        System.assertNotEquals(null, strJobId);
    }
}