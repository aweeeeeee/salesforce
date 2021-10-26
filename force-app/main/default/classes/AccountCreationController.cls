public with sharing class AccountCreationController {
    //lwc

    @AuraEnabled
    public static Account createAccount(Account accountRec){
       try {
        insert accountRec;
        return accountRec;
       } catch (Exception ex) {
           throw new AuraHandledException(ex.getMessage());
       }
    }

    @AuraEnabled
    public static List<Account> createAccounts(List<Account> accountList){
        insert accountList;
        return accountList;
    }

}
