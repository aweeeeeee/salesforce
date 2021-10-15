public with sharing class awe {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        return [SELECT Id, Name, type, Industry FROM Account limit 10];
    }

    @AuraEnabled
    public static List<Account> getAccountRecordList(){
        return [SELECT Id, Name, type, Industry FROM Account limit 10];
    }
}