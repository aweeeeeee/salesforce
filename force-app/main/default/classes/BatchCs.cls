global class BatchCs implements Database.Batchable<sObject>{
    private Integer magicNum =0;

    global Database.QueryLocator start(Database.BatchableContext bc){
        System.debug('in the execute method');
        return Database.getQueryLocator('Select Id, Name From Account Limit 100');
    }

    global void execute(Database.BatchableContext bc, List<Account> scope){
        System.debug('in the execute method 2');
        for (Integer i = 1; i <= 5; i++){
            magicNum++;
        }
    }

    global void finish(Database.BatchableContext bc){
        System.debug('in the finish method');
        system.debug('magic num' + magicNum);
    }
    //BatchCs a = new BatchCs();
    //Database.executeBatch(a,100);
}
